Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVt12-0004V0-Uf
	for mharc-qemu-riscv@gnu.org; Tue, 05 May 2020 04:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVt0z-0004NX-Ht; Tue, 05 May 2020 04:33:22 -0400
Resent-Date: Tue, 05 May 2020 04:33:21 -0400
Resent-Message-Id: <E1jVt0z-0004NX-Ht@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVt0j-0001dQ-HQ; Tue, 05 May 2020 04:33:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588667563; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LGkKkTsKOsDNfoWDd0WnfC0FOBUzgX9MfAPBSnRe6t7IPnJ1SZ9t1BKAiIxQMFbTeZWRFjoiSXYivGVf2bMHZw1umeIcR1yT/W94N9uItaWtt733wUvutRds2KzxUORdZXV4ZnCowcnRxWeHmPr2Euw81Jdkm2eprXW6kDOO2dE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1588667563;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Hjvw6NJvYofYO6bZKLN4BKx545jpO693CGT3ySL/+zE=; 
 b=N/IepVrn8sGGFxhLtRFWfDm1CreakPUW2adzf2DezOM2OZqanJZ5m2N0L90utSQjOw6/wj5ESEcCoTcjxj6V/aH81D1ANJRcZ0N/5q4/nf9tSvNWW08wMjda9hKgCykX5oCQ/3OxWB+0cCn7sX0CWF4jlA1Uslqed6M7darnkVg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1588667562257715.0200390202127;
 Tue, 5 May 2020 01:32:42 -0700 (PDT)
Message-ID: <158866756022.24779.15250571115216532173@45ef0f9c86ae>
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
Subject: Re: [PATCH v3 00/12] user-mode: Prune build dependencies (part 1)
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, qemu-riscv@nongnu.org,
 ehabkost@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, qemu-s390x@nongnu.org,
 palmer@dabbelt.com, pbonzini@redhat.com, philmd@redhat.com, rth@twiddle.net
Date: Tue, 5 May 2020 01:32:42 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 04:16:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 05 May 2020 08:33:23 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUwNDE1MjkyMi4yMTM2
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgYXNh
biBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIg
b3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2Jh
Ymx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1hZ2UtZmVkb3JhIFY9MSBO
RVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRfTElTVD14
ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MDUwNDE1MjkyMi4yMTM2NS0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3RpbmcuYXNhbi8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==

