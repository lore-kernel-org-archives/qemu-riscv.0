Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k67w5-0004Xd-HR
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 03:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k67w3-0004TF-Tf
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 03:46:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k67w2-0002qc-2H
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 03:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597304761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Me4RFj/JVSZpwCThTMm0Kv88fJLMSdD2S6cQrEZLU68=;
 b=elVvKs4jwy+pJONWifFZUD5dXntQT8n5SFDoe9bEd8dtKhk/PchaIAsncXE3sa9gR4Zovv
 rWHKr9a7IWks5YxPEnim9gW37k7CB9eCB3c5KtExITvIAXs24lKYnvgSs9+U+wo04sor35
 WTCYOh9nhwncxgn+eZhKb1GfySuObek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-Irm5_RH7OHaD0l_Aw_kW1Q-1; Thu, 13 Aug 2020 03:45:59 -0400
X-MC-Unique: Irm5_RH7OHaD0l_Aw_kW1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E882C81CAF9;
 Thu, 13 Aug 2020 07:45:56 +0000 (UTC)
Received: from localhost (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8836270597;
 Thu, 13 Aug 2020 07:45:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Stefan Berger <stefanb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alex Williamson <alex.williamson@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 6/9] scripts/cleanup-trace-events: Fix for vcpu property
Date: Thu, 13 Aug 2020 06:22:54 +0100
Message-Id: <20200813052257.226142-7-stefanha@redhat.com>
In-Reply-To: <20200813052257.226142-1-stefanha@redhat.com>
References: <20200813052257.226142-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 13 Aug 2020 07:46:04 -0000

RnJvbTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgoKQ29tbWl0IGE0NGNm
NTI0ZjggInNjcmlwdHMvY2xlYW51cC10cmFjZS1ldmVudHM6IFVwZGF0ZSBmb3IgY3VycmVudApw
cmFjdGljZSIgbGltaXRlZCBzZWFyY2ggdG8gdGhlIGlucHV0IGZpbGUncyBkaXJlY3RvcnkuICBU
aGF0J3Mgd3JvbmcKZm9yIGV2ZW50cyB3aXRoIHRoZSB2Y3B1IHByb3BlcnR5LCBiZWNhdXNlIHRo
ZXNlIGNhbiBvbmx5IGJlIGRlZmluZWQKaW4gcm9vdCBkaXJlY3RvcnkuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAw
ODA2MTQxMzM0LjM2NDYzMDItMi1hcm1icnVAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogc2NyaXB0cy9jbGVhbnVwLXRy
YWNlLWV2ZW50cy5wbCB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jbGVhbnVwLXRyYWNl
LWV2ZW50cy5wbCBiL3NjcmlwdHMvY2xlYW51cC10cmFjZS1ldmVudHMucGwKaW5kZXggZDRmMGU0
Y2FiNS4uNmMzNzY3YmQ2YSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jbGVhbnVwLXRyYWNlLWV2ZW50
cy5wbAorKysgYi9zY3JpcHRzL2NsZWFudXAtdHJhY2UtZXZlbnRzLnBsCkBAIC0zMSwxMCArMzEs
MTIgQEAgb3BlbihJTiwgJGluKSBvciBkaWUgIm9wZW4gJGluOiAkISI7CiBjaGRpcigkZGlyKSBv
ciBkaWUgImNoZGlyICRkaXI6ICQhIjsKIAogd2hpbGUgKDxJTj4pIHsKLSAgICBpZiAoL14oZGlz
YWJsZSB8KHRjZykgfHZjcHUgKSooW2Etel8wLTldKylcKC9pKSB7Ci0gICAgICAgIG15ICRwYXQg
PSAidHJhY2VfJDMiOwotICAgICAgICAkcGF0IC49ICdfdGNnJyBpZiAoZGVmaW5lZCAkMik7Ci0g
ICAgICAgIG9wZW4gR1JFUCwgJy18JywgJ2dpdCcsICdncmVwJywgJy1sdycsICctLW1heC1kZXB0
aCcsICcxJywgJHBhdAorICAgIGlmICgvXihkaXNhYmxlIHwodGNnKSB8KHZjcHUpICkqKFthLXpf
MC05XSspXCgvaSkgeworICAgICAgICBteSAkcGF0ID0gInRyYWNlXyQ0IjsKKyAgICAgICAgJHBh
dCAuPSAnX3RjZycgaWYgZGVmaW5lZCAkMjsKKyAgICAgICAgb3BlbiBHUkVQLCAnLXwnLCAnZ2l0
JywgJ2dyZXAnLCAnLWx3JywKKwkgICAgZGVmaW5lZCAkMyA/ICgpIDogKCctLW1heC1kZXB0aCcs
ICcxJyksCisJICAgICRwYXQKICAgICAgICAgICAgIG9yIGRpZSAicnVuIGdpdCBncmVwOiAkISI7
CiAgICAgICAgIHdoaWxlIChteSAkZm5hbWUgPSA8R1JFUD4pIHsKICAgICAgICAgICAgIGNob21w
ICRmbmFtZTsKLS0gCjIuMjYuMgoK


