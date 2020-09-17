Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJ1AI-0008Eq-JY
	for mharc-qemu-riscv@gnu.org; Thu, 17 Sep 2020 17:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ1AH-0008EZ-6m; Thu, 17 Sep 2020 17:10:01 -0400
Resent-Date: Thu, 17 Sep 2020 17:10:01 -0400
Resent-Message-Id: <E1kJ1AH-0008EZ-6m@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ1AD-0006db-Mi; Thu, 17 Sep 2020 17:10:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600376979; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Censd15+vdgACRDwztYwXHihr3I71j/hMRlwGBU9q1mDCq0Crq4v1g/Yj2qKaAeRTaj5s6+M+nBPJlBR2jX//FFN1qMSN8AhrTIBMdQd9V5ymuRP3DVxSnaTh752SsspvMOt1WKpw6KNIGHBYUqDpeXJIZOYzmb+JRg+wsFcW2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600376979;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=n2Huck5JO8XWMX3gMR2Zx2LoOLog2MKqEy2NqDS2c6M=; 
 b=cN6VoShRDjEC6ML3mSyg5iNCqep+g59qH6hX7SMnJBrYeB4KqVrT+B3azzexYWal5PeDIAgQ2GSGsA/v6tEcWnSu5Yo7Onzt8Q16Mc9y+GbwaTmhr/bl8aa2Jspujl6R0xGTHhr7FPsPAbkURoWUz5jqCrFZvLGYgmud0DGHEZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600376978800875.6770991938682;
 Thu, 17 Sep 2020 14:09:38 -0700 (PDT)
Subject: Re: [PATCH] riscv: Add semihosting support [v7]
Message-ID: <160037697666.8478.14999912571369850368@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200917210200.1589999-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-riscv@nongnu.org, keithp@keithp.com
Date: Thu, 17 Sep 2020 14:09:38 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 16:16:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 17 Sep 2020 21:10:01 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzIxMDIwMC4xNTg5
OTk5LTEta2VpdGhwQGtlaXRocC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKCk4vQS4gSW50ZXJuYWwgZXJyb3Igd2hpbGUgcmVhZGluZyBsb2cgZmlsZQoK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjAwOTE3MjEwMjAwLjE1ODk5OTktMS1rZWl0aHBAa2VpdGhwLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

