require File.expand_path '../spec_helper.rb', __FILE__


describe "Filter my feed" do
  use_vcr_cassette

  it "should print tweets containing 'on' in their content" do
    get '/'
    last_response.should be_ok
    last_response.body.should eql "TechCrunch: SMB Business Management Startup Booker Books $35 Million In New Funding http://t.co/Zh3kA4CHUU by @ryanlawlerRudimental: Spread Love Go Far ✌️ ❤️ #EncourageEveryoneIn4WordsRudimental: RT @LEAFelectronic: We're so excited to have the @BlackButterRecs family join LEAF Conversation w/ @RudimentalUk this Friday! #LEAF2015 htt…350 dot org: RT @guardianeco: UPDATED RT @dpcarrington: @bankofengland warns of 'huge' financial risk from #fossilfuel investments http://t.co/8rItZvcYQ…DHH: RT @voxdotcom: Hillary Clinton's personal email account looks bad now. But it was even worse at the time. http://t.co/cqkazRpyvJ http://t.c…ADEME: RT @rosesarkissian: Au colloque de l'association #effinergie présidée @jjqueyranne table-ronde avec notamment @BuisSabine @Denis_Baupin, B.…3D Print .com: This 2-String 3D Printed Violin is Part of Something Special Which Could Revolutionize Music - http://t.co/KjPiwo0YGV http://t.co/8Wj4NwS3rRStackOverflowCareers: Software Development Engineer at Amazon (@InsideAmazon) [Cambridge, MA] http://t.co/WPJb2WSisE #javaAndrzej Krzywda: You don't need to wait for your backend: Decisions and Consequences\n\n2 techniques and their pros/cons\n\nhttp://t.co/S6I5u0c0brOlivier Lacan: RT @janl: Berlin: A friend is looking for a junior web-dev position that gets them up to speed with real world experience. Hard worker &amp; fa…藍染 惣右介: RT @jzb: Almost no chance this isn't going to find its way into a presentation of mine soon. http://t.co/hwkETDVLlZMathieu: RT @theatreGaronne: #THEQUIETVOLUME #AntHampton #TimEtchells pour 2 personnes dans une bibliothèque. 1ère française @theatregaronne http://…Full Stack Fest: We're happy to announce that the amazing @tomdale will be joining us on stage! Check out more speakers at http://t.co/dVzSqK1Xa2"
  end
end