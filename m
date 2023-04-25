Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOOd-000867-Hx
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOb-00084J-F4
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:13 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOOV-00043C-QE
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:32:13 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8bcfbf276so56914541fa.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451126; x=1685043126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
 b=I+zZ5u3gA753DpP5BO5TOyihJ1P8U7gPF3Av7Zt3UhPqfHy5DV8WTGBdk4lS08QBVz
 0oQAaoTj/XlWRHaQWg/JlDXWjm8S70zX7bwyoMlnLeHCXOhZdTypUWko+gf934qrEU+6
 Z24SCEbDwjcGpVI89poNefs9nh9BN5rOSa4q3gZ3LyYPVH4s+N+nzUw4rgvgMOqiOSTF
 fCvKswuvgLjRuHYGR+QnK1a1CVQnFY4ykS4JTpmfyastT692aoP+Hf28nDl7yr+zgGLN
 7JS7Y+iVmIKtqgj4O4QfM1jhrcWRjwRcBHexbV17BLmm9Ko1oRBRbex/nzQUMa3ou/T6
 0DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451126; x=1685043126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
 b=MWrAQ35ohESATdLIYHQMCdq2heJlN2PtcOcZv5MdRvFw30iKmEBvqK+tnWzDj8x+sS
 sdSd4/E0FOWB/4wDJtsd+2y+rlJP7u71bZQCGIAIpCNzBaiUhiRhpZZ1ty48AsLtOd+P
 fOCMW6DhjCUc29maMBT9x3AT2vcFC5TYgW+0+rI5I9Hv5xaRxhZRzl3GkF+J3G4FCQCg
 igobc2cb5+B67opwQ25I6j8idKleBMn/QfoUEka32Zhc1q2r6BXjWs98CodSddVpeiUW
 C0Tq4+KKQPbUzrsNZMl8CvnB4WlANsugG7mc+dMxU52Mzy5SZPgNfomHkrYjeRRsaHkI
 dk3g==
X-Gm-Message-State: AC+VfDyrz+KYBqIhZs0epEHCgUF8xQo2+dcixT6oiKWON2XV8Y0xp6N/
 HAxYsf6F5cxVBXsWFNAt3ZVCnw==
X-Google-Smtp-Source: ACHHUZ40V/gCBTfrOiARQdHi8KdyrUtqTSkEyQswfqvNRpw0+DoDqvVws44cCyTiS25zaQg6GUM4SQ==
X-Received: by 2002:a2e:8302:0:b0:2ab:19a0:667b with SMTP id
 a2-20020a2e8302000000b002ab19a0667bmr1315313ljh.0.1682451125790; 
 Tue, 25 Apr 2023 12:32:05 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:32:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 01/57] include/exec/memop: Add bits describing atomicity
Date: Tue, 25 Apr 2023 20:30:50 +0100
Message-Id: <20230425193146.2106111-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:32:13 -0000

These bits may be used to describe the precise atomicity
requirements of the guest, which may then be used to
constrain the methods by which it may be emulated by the host.

For instance, the AArch64 LDP (32-bit) instruction changes
semantics with ARMv8.4 LSE2, from

  MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
  (64-bits, single-copy atomic only on 4 byte units,
   nonatomic if not aligned by 4),

to

  MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
  (64-bits, single-copy atomic within a 16 byte block)

The former may be implemented with two 4 byte loads, or
a single 8 byte load if that happens to be efficient on
the host.  The latter may not, and may also require a
helper when misaligned.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 25d027434a..04e4048f0b 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -81,6 +81,42 @@ typedef enum MemOp {
     MO_ALIGN_32 = 5 << MO_ASHIFT,
     MO_ALIGN_64 = 6 << MO_ASHIFT,
 
+    /*
+     * MO_ATOM_* describes that atomicity requirements of the operation:
+     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if and
+     *    only if it is aligned; if unaligned there is no atomicity.
+     * MO_ATOM_NONE: the operation has no atomicity requirements.
+     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
+     *    by the alignment.  E.g. if the address is 0 mod 4, then each
+     *    4-byte subobject is single-copy atomic.
+     *    This is the atomicity of IBM Power and S390X processors.
+     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
+     *    is unaligned, so long as it does not cross a 16-byte boundary;
+     *    if it crosses a 16-byte boundary there is no atomicity.
+     *    This is the atomicity of Arm FEAT_LSE2.
+     *
+     * MO_ATMAX_* describes the maximum atomicity unit required:
+     * MO_ATMAX_SIZE: the entire operation, i.e. MO_SIZE.
+     * MO_ATMAX_[248]: units of N bytes.
+     *
+     * Note the default (i.e. 0) values are single-copy atomic to the
+     * size of the operation, if aligned.  This retains the behaviour
+     * from before these were introduced.
+     */
+    MO_ATOM_SHIFT    = 8,
+    MO_ATOM_MASK     = 0x3 << MO_ATOM_SHIFT,
+    MO_ATOM_IFALIGN  = 0 << MO_ATOM_SHIFT,
+    MO_ATOM_NONE     = 1 << MO_ATOM_SHIFT,
+    MO_ATOM_SUBALIGN = 2 << MO_ATOM_SHIFT,
+    MO_ATOM_WITHIN16 = 3 << MO_ATOM_SHIFT,
+
+    MO_ATMAX_SHIFT = 10,
+    MO_ATMAX_MASK  = 0x3 << MO_ATMAX_SHIFT,
+    MO_ATMAX_SIZE  = 0 << MO_ATMAX_SHIFT,
+    MO_ATMAX_2     = 1 << MO_ATMAX_SHIFT,
+    MO_ATMAX_4     = 2 << MO_ATMAX_SHIFT,
+    MO_ATMAX_8     = 3 << MO_ATMAX_SHIFT,
+
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
     MO_UW    = MO_16,
-- 
2.34.1


