Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqpl4-0001WB-CZ
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 01:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert_bu@realsil.com.cn>)
 id 1nqm4J-0004nF-AL
 for qemu-riscv@nongnu.org; Mon, 16 May 2022 21:32:11 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:45659
 helo=rtits2.realtek.com.tw)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert_bu@realsil.com.cn>)
 id 1nqm4G-00020d-5L
 for qemu-riscv@nongnu.org; Mon, 16 May 2022 21:32:10 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 24H1Vv5yA006411,
 This message is accepted by code: ctloc85258
Received: from RSEXMBS01.realsil.com.cn ([172.29.17.195])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 24H1Vv5yA006411
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 17 May 2022 09:31:57 +0800
Received: from RSEXDAG02.realsil.com.cn (172.29.17.196) by
 RSEXMBS01.realsil.com.cn (172.29.17.195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 17 May 2022 09:31:56 +0800
Received: from RSEXMBS01.realsil.com.cn (172.29.17.195) by
 RSEXDAG02.realsil.com.cn (172.29.17.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 17 May 2022 09:31:56 +0800
Received: from RSEXMBS01.realsil.com.cn ([fe80::1894:b87b:3447:b914]) by
 RSEXMBS01.realsil.com.cn ([fe80::1894:b87b:3447:b914%7]) with mapi id
 15.01.2044.013; Tue, 17 May 2022 09:31:56 +0800
From: Robert Bu <robert_bu@realsil.com.cn>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: No disassembly of RISC-V RVV instructions?
Thread-Topic: No disassembly of RISC-V RVV instructions?
Thread-Index: AdhpjWY7iur/d3/KQdKUEry4wco1hw==
Date: Tue, 17 May 2022 01:31:56 +0000
Message-ID: <9f772a7a20334807995d225d84410742@realsil.com.cn>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.26.103]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: none client-ip=211.75.126.72;
 envelope-from=robert_bu@realsil.com.cn; helo=rtits2.realtek.com.tw
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 May 2022 01:28:33 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2022 01:32:11 -0000

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhlcmUncyBubyBzdXBwb3J0IG9mIGRpc2Fzc2VtYmx5IG9m
IFJWViBpbnN0cnVjdGlvbnMuIElmIEkgdHVybiBvbiAiLWQgaW5fYXNtIiwgSSBzaW1wbHkgZ2V0
ICJpbGxlZ2FsIiBmb3IgYW55IFJWViBpbnN0cnVjdGlvbnMuDQpDaGVja2VkIGRpc2FzL3Jpc2N2
LmMsIG5vIFJWViBpbnN0cnVjdGlvbnMnIHN1cHBvcnQgaXMgZm91bmQuIERvIEkgbWlzcyBhbnl0
aGluZz8NCg0KVGhhbmtzDQpSb2JlcnQNCg==

