Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVF8X-0007JI-8K
	for mharc-qemu-riscv@gnu.org; Mon, 05 Sep 2022 12:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVF8W-0007J1-H5
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 12:39:48 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVF8U-0003DQ-Ta
 for qemu-riscv@nongnu.org; Mon, 05 Sep 2022 12:39:48 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w2so12087312edc.0
 for <qemu-riscv@nongnu.org>; Mon, 05 Sep 2022 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fiYa+bP97eG+wQcfayoeQ3geZEccRlmA5MPJU77GJHc=;
 b=KL+cTUKUQJq+5pHZJjwme8WfNGdZxQjZc/PTa3YVSnMgSDojm1Vwx1s+E2prQnciKe
 Xs0cTI3Ahi60EHz+0vf45jvQf4mJnagvjSYJtK3BkDUuGB0i0aKGn41Norlgw7Ih62gg
 jZuz7uWfrPg/ddWnn9PI49daf87kU/S+xGUEUUCmNUvCD5SIQsfcbcBwMGJzZgFniXyh
 Lvt1RoCX8iY7XScRtI2Qmp2WwJ9PE+LCSpenyhlISAJpL/tbaeV1NShVEyLhPR0gP015
 PPzI3E5pqVftOnfT2oK+BbxAHJ+u4QiAJy2f2dU1Ys7tI7ucfA4keVfvWfi07h3lEAGO
 rkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fiYa+bP97eG+wQcfayoeQ3geZEccRlmA5MPJU77GJHc=;
 b=3bBrQFFbNY9vf302tbGLgCjYeYfxFEEmar6d7pJQ3HoGIN1M4UIDS2tPtqe5twxp3Y
 9xp55YCzNBLnad5nVlxPeYOcRw4OfwZICOVxWZHe1XUKoABtFWxDdtzS742J5ieRx0fz
 ydHOpkcSanIam6FKyD8roCwpzB4yaRgJfqEF0DyOPiTGiFgd1TS/Llbm30HQMZXr8Mxp
 G1OsVqlj/siD1g4/zH8VyN8Hxzm/pnj3/ctUZRHBO04AFSPcY2BRAIidinTcUVgevPxR
 Aag7kxNv7aeoOG/R0aaGIknTz4M2fm/5QoI6tCM7qGVjMP6/wg3mmSXUShD/dMF9ymZj
 83eg==
X-Gm-Message-State: ACgBeo3ERt04hQ+EWiESwPxZakfZqlmjEkSS3eH6l3CtoiyizHyFiUrX
 sF6p/7K0YCV068PYDtPFAjMWaA==
X-Google-Smtp-Source: AA6agR59rCygW4HAG6XoIuTzV29mJHqV+8VyJcLIAcUqxTv8GeNA5cfV0yt8VqjVblntsnwntU7Xvw==
X-Received: by 2002:a50:baea:0:b0:448:182d:9bc2 with SMTP id
 x97-20020a50baea000000b00448182d9bc2mr37419693ede.341.1662395985193; 
 Mon, 05 Sep 2022 09:39:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709061da900b007477ee86946sm5192076ejh.87.2022.09.05.09.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:39:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 325C91FFB7;
 Mon,  5 Sep 2022 17:39:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] docs/system: clean up code escape for riscv virt platform
Date: Mon,  5 Sep 2022 17:39:39 +0100
Message-Id: <20220905163939.1599368-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 Sep 2022 16:39:48 -0000

The example code is rendered slightly mangled due to missing code
block. Properly escape the code block and add shell prompt and qemu to
fit in with the other examples on the page.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/riscv/virt.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index f8ecec95f3..4b16e41d7f 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -168,14 +168,19 @@ Enabling TPM
 
 A TPM device can be connected to the virt board by following the steps below.
 
-First launch the TPM emulator
+First launch the TPM emulator:
 
-    swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
+.. code-block:: bash
+
+  $ swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
         --ctrl type=unixio,path=swtpm-sock
 
-Then launch QEMU with:
+Then launch QEMU with some additional arguments to link a TPM device to the backend:
+
+.. code-block:: bash
 
-    ...
+  $ qemu-system-riscv64 \
+    ... other args .... \
     -chardev socket,id=chrtpm,path=swtpm-sock \
     -tpmdev emulator,id=tpm0,chardev=chrtpm \
     -device tpm-tis-device,tpmdev=tpm0
-- 
2.34.1


