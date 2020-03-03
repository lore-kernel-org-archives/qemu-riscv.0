Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j94YT-00058T-An
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 05:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j94YR-00052t-Ba
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 05:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j94YQ-0007YW-Cp
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 05:13:35 -0500
Resent-Date: Tue, 03 Mar 2020 05:13:35 -0500
Resent-Message-Id: <E1j94YQ-0007YW-Cp@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21183)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j94YH-0007Mb-N3; Tue, 03 Mar 2020 05:13:25 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1583230325; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HJui90dmal5gFRjeExeS8uWwYw89jeRE9eXk7Hvl7EvwLj+hNyu4ILSMnrk1mxKiWRFph/MsPkzSDAmnQJrPKgUSc0kpr/3GVbPxQ1vBOFKIxQVbG/Rw5QNfDQWOEvYZzQTfuO69ILGCMbjA4P5lbh3fBXbutYv7AAkHSOHcuDg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583230325;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=6tvEHzLV8Y2BN3NFBkXfhq6qIJOKVMcB5ZrULr1xuWo=; 
 b=A5lGWHBQqjj1+QdUnpTkZfHmXgl/bURgnfS5o6n6PkABABZfz99rtcW7HKKaA54dX82QqudxmLQROZiMnXpvOaNdOaYBZ/7rG+bigj2HoblAiCC1rYfl61R3F0TjdbICMmwTnC0TkOLN3yq9BjTjXBznS1oH6oc+fTblm8k8qGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583230323372497.9472806181752;
 Tue, 3 Mar 2020 02:12:03 -0800 (PST)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <158323032029.8962.1118581099513261942@abdcc9e1aa82>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, crwulff@gmail.com, sagark@eecs.berkeley.edu,
 david@redhat.com, green@moxielogic.com, mark.cave-ayland@ilande.co.uk,
 jcmvbkbc@gmail.com, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 marex@denx.de, qemu-ppc@nongnu.org, aleksandar.rikalo@rt-rk.com,
 rth@twiddle.net, atar4qemu@gmail.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 michael@walle.cc, palmer@dabbelt.com, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Date: Tue, 3 Mar 2020 02:12:03 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 10:13:36 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMwMzEwMDUxMS41NDk4
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0
aGUgZG9ja2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBW
PTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5W
PTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxv
ZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDAzMDMxMDA1MTEu
NTQ5OC0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50
b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

