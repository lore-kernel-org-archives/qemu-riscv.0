Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRRYD-000355-84
	for mharc-qemu-riscv@gnu.org; Mon, 07 Mar 2022 23:34:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nRRYB-00034a-Ln; Mon, 07 Mar 2022 23:34:19 -0500
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190]:60536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laokz@foxmail.com>)
 id 1nRRY3-0006Vl-Gj; Mon, 07 Mar 2022 23:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1646714037;
 bh=Izmzw9Ny52QScMjhq5hfi46rlYy6asfwONWJxGLBz8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nrdgNpSrN7BtK/jrkR1Fc9hz6zvddBTqEHoLbArz8uklj6uzqCUbwdkNcYv9HgFyI
 TXs4mEQ9Yi1nGMeTAYtHeSoJuRBmLTM90VFA8r7eQM8+o76o+ZnIK/ABvwJRPqiEX0
 RTx6lEyIlF038mKz0mVIn2lZ9eqNngRNm7fRQltY=
Received: from swind.os ([60.17.0.33])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 869A50F9; Tue, 08 Mar 2022 12:33:41 +0800
X-QQ-mid: xmsmtpt1646714021t4oxr669u
Message-ID: <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85Nonwl8x2jCHWZ6n0Pc5TDvyhjdfKIhXWSgQJUKbq27sAKhUoecPM
 MMRY72+fhKvaCkoqGs8o08Jf+QFlsKLVsZjkvQjHTmbIqSAF6o752fI96CSKxmae6QDSchFPOuSC
 n3yXSEop61UIh98rpryUorMLpgkRxXkpw3bSjlNwDSp/JnB3XlMKWqJy94SfpWZeRZ6ENKQjTlHD
 xL4/w08FY+Dw4UU9RQZBdfnUMdPTwNeRwB9PdrLE1SkgGYjrPc2S//IGNBfTYS+c8CXtk3ZHiOdG
 1EPpXfQoKW1kOkvufD0nFicA+GWz7jEQ/07BQnIvdIUpaWVZw+fvHw/2+fo9Lpvfu7j8oEtAboRN
 4sFxPeVSYaDf6QbfCzmU4WQX3Nop4xmvypfL65jFLFcbO6rPTzh1BHpJ1xJE3zj2ry8Iu71fbSkm
 +TnDNrDrhUGjrujkN+ehbXK0WzepE/r8L/osg5PZMGRwn1UwfB/JOkaEbVLIXRR335uvfZCCiByN
 NSwxaT3Be5oScMpcbC7nmA6lbId4CHh+JXDy3de6EPSPk/lf3D/76CoAnySGtYLmeVp7HmG7UFmT
 nLZA/u8lPkshWPXKtM3t67uB27Hf2E1JRnsre3MClc0+DcxBtn3Ec4iFL2qCXdj5Ny5w0L1TXd/Z
 KoXJjupLNsIUhYuYqElHXZn6LvnPq5otaC4LHRlkQ2sptwQmSvggXBme242p/tv5V51Prpl/llN3
 RDYTmCPJcDJjEkPX5Mx03T/kx6NW/X481BjFIkkQstOSjMdp5B6+agnfm5pTtX/8dqdl3bcBkEhg
 vmeQL9SuvORWS0kelg9DE0BdmI8xtL3ICV0Gqiyt5kwbtlMLuTHkFyYilfryA+fbktsF93DKAI1J
 AwlIAaaPpE
From: laokz <laokz@foxmail.com>
To: hreitz@redhat.com,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: kwolf@redhat.com,
	laokz <laokz@foxmail.com>
Subject: [PATCH v2] tests: add (riscv virt) machine mapping to testenv
Date: Tue,  8 Mar 2022 12:33:39 +0800
X-OQ-MSGID: <20220308043339.7148-1-laokz@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
References: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.190; envelope-from=laokz@foxmail.com;
 helo=out203-205-221-190.mail.qq.com
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
X-List-Received-Date: Tue, 08 Mar 2022 04:34:20 -0000

Some qemu-iotests(040 etc) use PCI disk to do test. Without the
mapping, RISC-V flavor use spike as default machine which has no
PCI bus, causing test failure.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894

Signed-off-by: Kai Zhang <laokz@foxmail.com>
---
Thanks for the detailed info. Corrected S-o-b tag.

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


