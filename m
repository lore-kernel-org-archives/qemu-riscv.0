Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2aH-0007jz-BQ
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2aF-0007jA-8U
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:01:19 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2aC-0003fH-Tg
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:01:18 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id b6so391024vsu.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwnkfiTTd5TTKSiO/WBujmarOe5J9cJn8z3oPthnwl0=;
 b=iVoC9diIsuPfc1qmZw0roV4OI+3i/QRMYLuKgfFugUR30vhHs8c4u+YJf7UciESvvy
 pe631myRvlq661jp8auiP5sp9VXsadwj9jqInqY/VTtwnPSGE7xGgW2P2z0Wljg9plGH
 0aJj+SjrsfFCHuP0mfP8ik8nDN274WftAnKu5p5pjyge3U5f4HR+cYd71dk8a5qxzI7a
 dBZ1dor8KZI1HrilSlmtdcLn30c1Pp1W8JAaJBXZe/mPkQ0nv6RCduD+11aKvanQyEAk
 QRmYeHngPW+VmrTDpyadRREPkQrZueU+cXfhAKp2C0eIgeS4V00FL72Rz0o1xw69rDXw
 /MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwnkfiTTd5TTKSiO/WBujmarOe5J9cJn8z3oPthnwl0=;
 b=FVmJbejZh5MQtCVGWL7E7ayaoaRUTqDK1K5we8vzgvCSMO0E2plQntMEHh8/GXStsE
 rkYCt1+3YmPykv82efTDUa49rPy3EQOHde00uTVBqImd7qnIKs0inpn7vzedUsYn/2p+
 qRo58YAWoHMOFx1OuukpFK5cHIjperacFf9wc/TRGMtW5aQWM9yFqROxLAP2jIa5dfVd
 NPkp7kqPsBtOmOkC2vyund5RjCTD3Yw8KFHI8uk9J0LrSu/YjEblqmqnsPOOBk+y1Yg5
 AvZRPzEOXIDG+Hd/4lJvHPPbT5U4w0UYbUAigaMgBoEgPbr53k/jzdR1+bO1pcx6nTJz
 1+Jw==
X-Gm-Message-State: AAQBX9cgTcasB9kBQ382LAG5k+k+qmhSyUmM0q19f6tvGTzNHW5lhlzf
 kOQYdwhQmeRlTRUKYZ/bpvKP2d42cA3heZbPYCE=
X-Google-Smtp-Source: AKy350b7Y0GWSfDMf93LgRAABRVPWozNxPnS+tDz3nC603tp7+q+TP0714hu6Isil6FWSzyJ32qrIQ==
X-Received: by 2002:a17:90a:10d7:b0:234:f77:d6d2 with SMTP id
 b23-20020a17090a10d700b002340f77d6d2mr5737663pje.45.1679741689325; 
 Sat, 25 Mar 2023 03:54:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 21/25] target/riscv: Suppress pte update with is_debug
Date: Sat, 25 Mar 2023 03:54:25 -0700
Message-Id: <20230325105429.1142530-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 12:01:20 -0000

The debugger should not modify PTE_A or PTE_D.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ce12dcec1d..b26840e46c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1015,7 +1015,7 @@ restart:
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
     /* Page table updates need to be atomic with MTTCG enabled */
-    if (updated_pte != pte) {
+    if (updated_pte != pte && !is_debug) {
         if (!hade) {
             return TRANSLATE_FAIL;
         }
-- 
2.34.1


