Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nREN7-0005CC-BK
	for mharc-qemu-riscv@gnu.org; Mon, 07 Mar 2022 09:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nREN0-00052A-CM; Mon, 07 Mar 2022 09:29:56 -0500
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155]:33249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nREMr-0008Bd-NJ; Mon, 07 Mar 2022 09:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646663369;
 bh=yrvN8v1TFiD5RxXA7Vmqy7h2sTO7KmkAuhVGEAwSAas=;
 h=From:To:Cc:Subject:Date;
 b=JGZhBYgkTgaZvMplKm9wQcXJylJhR/xmSnsTWIpbSHxffcJYHxI5RNlBfnFqOvOux
 SWqmkXxwLRswJMwZyAeoOL4n+5R3w1qt5E0K50SVzVi74rfm+Bal/ljE4accL4Z9OW
 u4LGfXnpfotJqPDNI/4SYThfTqkI4q/mEKtONLsU=
Received: from swind.os ([60.17.11.82])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 3699BCA4; Mon, 07 Mar 2022 22:13:41 +0800
X-QQ-mid: xmsmtpt1646662421tix75l6x5
Message-ID: <tencent_451EA141786954DB4F7E4D7D4F9334EE1106@qq.com>
X-QQ-XMAILINFO: OakVxA/3u/8RQ/cySogOheUVDSVvbxXlqynx6Nd2MQggWWz2+1ghclaSTlncon
 i8d5iwJgXlE0QmJfPGtJgnozWj2bP+8FJ7ycRNCIhsxRCx18EqmtJuIKKNkwDRuLq8eK9WKuQbpx
 tIosLlFwaueStx8kkZnEg6AUJArMhSJwVYKPHKqdTNjjBcaWGIeitqByZA1CA10ucFT9nJIXy0EX
 fMl+9YDSQiVHX8PCcvATHNJ2bBLzrMcTxC0ZebDUUB5cnwBXHZXjKjaOPlniaz+Tsjb82oj16dkd
 7FrB3FHdx0QKj/s4RF5L/ZKcBLMFRzTozFHr5bTCygMvT0277/4Ii33/1ormy5a2EiL1YG9jkkuo
 AyJMEjIy93OydqUMo8sNIHc4zTHGAS7Hi6HLCyrzXvhSyFqupgf2I88UHGBHMnKli0f53HahRD/N
 e2jK3MjhhhbSiQQBJi7yKHEVJtrO73Y4g2jytoGy87AsDbmmqXafIje2H3NiSfI6XdxzI119azMt
 1/D+XZM/PMi16uqLO2ujcT+N6gXteflcttZJNS0MWRIHL87273Tbsf7DUNSPz3cJvsTi6XmSJ+de
 2ZGsmDJIaduKgrtLHf98wC1M6UjbKOGgXrHcHMmuAnZCe0AwFmwaNEyhBGndZ30cQHnEuX6vsKGx
 TwXBGw4mo2wTcbpTP9bzBRwtpPaNBKf0zLRZ++v/tX5LtJGuxXFJclyZdDFUgCWJLgE5QHC1PJEP
 pgt2jgwdqRx+GF3tv3SZ/8EPIe8fjCziO/GwNdbbB30tBw83Q+rPgkybD1l0sNoUEdxro/k/OvK6
 cWv3edabwpzgM0lWZ+rrOZiUgazDdPdYdx3suIqt4lDX4vN5B6DFIcEGBZP7qfBgresBrrM7P4PN
 5n25xejmopLTEiiBS06iYaJwO6N6mcBQc8zVJzrGSkNtVUVmcDgSc=
From: laokz <laokz@foxmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: hreitz@redhat.com,
	kwolf@redhat.com,
	laokz <laokz@foxmail.com>
Subject: [PATCH] tests: add (riscv virt) machine mapping to testenv
Date: Mon,  7 Mar 2022 22:13:36 +0800
X-OQ-MSGID: <20220307141336.19896-1-laokz@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.155; envelope-from=laokz@foxmail.com;
 helo=out203-205-221-155.mail.qq.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 07 Mar 2022 14:29:56 -0000

Some qemu-iotests(040 etc) use PCI disk to do test. Without the
mapping, RISC-V flavor use spike as default machine which has no
PCI bus, causing test failure.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894

Signed-off-by: laokz <laokz@foxmail.com>
---
 tests/qemu-iotests/testenv.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0f32897fe8..975f26a785 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -238,6 +238,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             ('aarch64', 'virt'),
             ('avr', 'mega2560'),
             ('m68k', 'virt'),
+            ('riscv32', 'virt'),
+            ('riscv64', 'virt'),
             ('rx', 'gdbsim-r5f562n8'),
             ('tricore', 'tricore_testboard')
         )
-- 
2.34.1


