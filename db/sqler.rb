require('pg')

class SqlEr
  def self.run(sql)
    db = PG.connect({ dbname: 'RPSLS', host: 'localhost'})
    result = db.exec(sql)
    db.close
    return result
  end
end