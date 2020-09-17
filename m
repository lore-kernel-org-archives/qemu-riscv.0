Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJ1J5-00030A-Nb
	for mharc-qemu-riscv@gnu.org; Thu, 17 Sep 2020 17:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ1Iy-0002zj-Dk; Thu, 17 Sep 2020 17:19:00 -0400
Resent-Date: Thu, 17 Sep 2020 17:19:00 -0400
Resent-Message-Id: <E1kJ1Iy-0002zj-Dk@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ1Iu-0008RO-VJ; Thu, 17 Sep 2020 17:18:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600377521; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=e1GAbu/W836NYB3aKHHppDXpBtTEG5MAC4GTIO8p1Qu1pr5WP73AbAcNb9VXz1N6r1s/GMx5mb0cM/Y91tOw0i4wFtKJyaBm+ZK8/Nr6IIt94YOx2XLD+4bez55j6CCPmN9BM/lvx0F/DkSbGs02GhtZuxBCrqTgWID0Vc1Ofto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600377521;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=eVfb+80IF3VWHXoz1zbgrsrfOJn24JADm4atbJO3i/M=; 
 b=cg3/GuAlYyp5jATZC7wxHtOhtPPdS+2gxQzRJK9/O0ZrQxU5YyqFGfc60j6FiT+azrH+GLfpk4MSwboCFDT9Lp2Q0KhFY229yghL0BK3dC3RmngKNcGRpDwQrHuuhZgo5opqcTZy2uljKJn1j4tGoIVQPUwYQ5fiLU38zh/S3lI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600377519894929.5426956184507;
 Thu, 17 Sep 2020 14:18:39 -0700 (PDT)
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
Message-ID: <160037751755.8478.7688754618698073497@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200917211321.1591257-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-riscv@nongnu.org, keithp@keithp.com
Date: Thu, 17 Sep 2020 14:18:39 -0700 (PDT)
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
X-List-Received-Date: Thu, 17 Sep 2020 21:19:01 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzIxMTMyMS4xNTkx
MjU3LTEta2VpdGhwQGtlaXRocC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKCk4vQS4gSW50ZXJuYWwgZXJyb3Igd2hpbGUgcmVhZGluZyBsb2cgZmlsZQoK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjAwOTE3MjExMzIxLjE1OTEyNTctMS1rZWl0aHBAa2VpdGhwLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

