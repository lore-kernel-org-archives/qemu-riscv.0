Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aF-0005O4-HA
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zr-0004z2-5l
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zn-0005Z6-UA
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so47567245e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097618; x=1685689618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
 b=rCmOgqNAQXzxJaeE44P1uzRxHyYzgGSz+R20lDdTbMbEeULdSML9aJ7Jy6O8YKxeua
 RQnf0qy6x2T3KLgONhUoeTN+4yxzxYCmkjLYYDEmyxrOC00Doov9XJwAvv4e9n4yTz+N
 UIzjh+1vq0Sc5IPjn6js4IDLQ6DMzgUj14Bj4AMQo9/2LxS+zeSLTXkTuJVWCDQwuToI
 Od688Wzlfjnq/rB3ZbOAUHj/WIa/hMG6SK2fYfiZ/JaTD5LsThm60muVfThy19pMhBt4
 wDYpshDaeuSWEyNc+S+krKRRhBw0IqUh0YxtwS9RnzX9JkewWWc6QnPtigfy9TX57zYV
 qv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097618; x=1685689618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lrJF/qXESqdgqxzYXiwMDd8bhgg68V4bNiRRkSEKr0=;
 b=EfvNyLsD8MSkIxmc19o5kRTNUNBxvusPwP+H2vhQVsM5WUfV3+cKfdOIhoB8/d7paV
 cfGpt9sVvBVrZP0wlLBYy1UfPS86SDegTAaX9+9BLB2O9XGLZ+CF0mf1YciUsvIcAXVl
 HGMmTb0IE65flOyfZPfaVLbImI40xRkibjfmgsqgJxsS0X02wY6BFPOg1TbRFKcRaZ7N
 QbBvgTbHifGb/tFQQuJCwIpj2YXfJZD9iiea7zjF7nKcroIFTzWvM5QvzZ6njLm9XCNd
 n48VDdfadaQ2Yo5yML615lfTCGginMxq6fPCgZThuRVe3Q+oiWPRnAXgzYH9PqKcYhpf
 4iOQ==
X-Gm-Message-State: AC+VfDxZ9FG2k2hEIwc/+CNXH1oS+ZChWihDZIj3s54Djhx1hPeS2uEt
 kwqx50GpF2lBXOJGGvwwgMBH6A==
X-Google-Smtp-Source: ACHHUZ6HZknxjkIjOTnL/jTJnQK537wsWbM7Yod/9DV9Ne602iFmwSW+LsmqsaVqKJ8hpFb4xRUTJw==
X-Received: by 2002:a7b:cd18:0:b0:3f1:9525:7bb6 with SMTP id
 f24-20020a7bcd18000000b003f195257bb6mr13570542wmj.5.1683097618487; 
 Wed, 03 May 2023 00:06:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 01/57] include/exec/memop: Add bits describing atomicity
Date: Wed,  3 May 2023 08:06:00 +0100
Message-Id: <20230503070656.1746170-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:04 -0000

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


