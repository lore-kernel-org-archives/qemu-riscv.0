Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWsPw-00021t-Vz
	for mharc-qemu-riscv@gnu.org; Fri, 31 May 2019 21:02:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sunny.desai@lewiz.com>) id 1hWr8V-0006ty-ID
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 19:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sunny.desai@lewiz.com>) id 1hWr8U-0002k9-Kj
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 19:40:35 -0400
Received: from mail48c45.carrierzone.com ([216.55.147.48]:51804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sunny.desai@lewiz.com>)
	id 1hWr8T-0002UI-OF
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 19:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1559346018;
	bh=5UTpkfmm6cUeUX9WiMmN3otYz4pSM2KmQ8wqrOfkGUA=;
	h=To:CC:Subject:From:Date:From;
	b=Lbj99ELBPTEdEMoHSfh1SplphRPpEcHntW93ElL60pNW5+3fetoomIhWQa/0BcziN
	vXF8lDYFunFwgWM49QIBtHQUL2myI5hP/Wi7UzgM7PfA9ePjrBWGohglrkbHRSCi+2
	qJ8JnzcDnkXWlKhWnvTrS03b1ps3FRFXMTXDSo3I=
Feedback-ID: sunny.desai@lew
Received: from mail48c45.carrierzone.com (localhost [127.0.0.1])
	by mail48c45.carrierzone.com (8.14.9/8.13.1) with ESMTP id
	x4VNeH9n010942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <qemu-riscv@nongnu.org>; Fri, 31 May 2019 23:40:18 +0000
Received: (from webmail@localhost)
	by mail48c45.carrierzone.com (8.14.9/8.12.2/Submit) id x4VNeGcp010941
	for qemu-riscv@nongnu.org; Fri, 31 May 2019 19:40:16 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=_afe6e35ec258fc8a8014283fa9ec0dc5"
To: qemu-riscv@nongnu.org
CC: 
From: sunny.desai@lewiz.com
X-Image-Url: https://websitesmail.att.com/api/storage/sunny.desai@lewiz.com/profile/picture
Date: Fri, 31 May 2019 19:40:16 -0400
Message-Id: <1559346016.wqb0u574gs8o0o4s@websitesmail.att.com>
X-CTCH-RefID: str=0001.0A090201.5CF1BB62.0028, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=CIwEoyjD c=1 sm=1 tr=0 a=WkljmVdYkabdwxfqvArNOQ==:117
	a=E5NmQfObTbMA:10 a=B9z_aWkGXl3QkkCgRjgA:9 a=QEXdDO2ut3YA:10
	a=p-dnK0njbqwfn1k4-x12:22 a=jjky5lfK57Ii_Ajn6BuG:22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 216.55.147.48
X-Mailman-Approved-At: Fri, 31 May 2019 21:02:39 -0400
Subject: [Qemu-riscv] Details about QEMU.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 23:40:36 -0000

--=_afe6e35ec258fc8a8014283fa9ec0dc5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


=09


Hello,

I am currently working on Qemu on a very basic level and I am interested to=
 know how Qemu communicates with the programmable logic?

Suppose, I am using serial communication between QEMU and PL.,&nbsp; can so=
meone please guide me the flow of data from PL side to PS side?




Thank you,
Sunny



--=_afe6e35ec258fc8a8014283fa9ec0dc5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<head>
	<title></title>
</head>
<body>
<div class=3D"userStyles" style=3D" font-family: Arial; font-size: 12pt; co=
lor: #000000;">Hello,<br>
<br>
I am currently working on Qemu on a very basic level and I am interested to=
 know how Qemu communicates with the programmable logic?<br>
<br>
Suppose, I am using serial communication between QEMU and PL.,&nbsp; can so=
meone please guide me the flow of data from PL side to PS side?<br>
<br>
<br>
<br>
<br>
Thank you,<br>
Sunny</div>


</body>
--=_afe6e35ec258fc8a8014283fa9ec0dc5--

