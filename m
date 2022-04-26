Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njUIw-0005Qw-48
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 19:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIt-0005L5-Ta
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIr-0000IW-BS
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id i62so90570pgd.6
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdEjmljNRZQoLffMrBdqTb34Kjoj9AW0utDokXRYpVs=;
 b=3X/TcEK4QMbY03XIF/HMNBGRbU8YFhl7fYPEgTSdpQ3QuO7tUqsR2OKhGXgPjRjVzo
 YlsjSWwoBS3S8R0DwTIMFci8x21WVFZbZQinFOT7hb4C7oohw2ECFKTlRgff7Y7ha+vn
 sU7EL5vcz9SiLwmoHTZmWgWQ9Uo1o6vk+QTyKfIaKlXJXntKbgFVjihJJHJ4c4DPmTaF
 0peRoVC2M80C9B0m8QhFr/l+TdlNXrvp6/Lmy6DBGViWsODoHRhuNkqJdzQqm65WkN+i
 ukWiNCofCb+s5kTYN2sU99A49Tcopvkd2BFy/cJiyC1iHOc5DtOjp9fY9bl/U5V1Tq1t
 gbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdEjmljNRZQoLffMrBdqTb34Kjoj9AW0utDokXRYpVs=;
 b=4UvnGbOSEk45Pxs6ullwYZg7A6wgglE2/ckCDbGnoNOius7uKB3t0mxGuPDzRY1qOJ
 LBfVkgaa9YgQZQ7irqvRqN02zlqGyro60CZrZSRkchjg+yUYKrK+wCTy1xjsQZfeFqSj
 waYRZVuxQ/kPekKv4cTry3XBK+q7TE3nVV4rh77qDnCZER224airDEszDEhyKAzzdLSQ
 a3R0zGal0ND4kAV22DGU6JvYjIUsQWwXt3AGaPeRyPrP9yZWfboQcKowG1mA8pZE+Pcw
 T5aXmPr+saUKr+3x/sHzf8y9W2OzM+Vb+/d8YdHYHxTWITBsfDlPbyEcnyd0qmGe8mOn
 +jww==
X-Gm-Message-State: AOAM530rEvCgoVxcv3UytaG70cueR9E2PqNEUDChKu7DUU0F886W6w9v
 wJkvL/qJb6rU+dzSD7UdZ6ySeg==
X-Google-Smtp-Source: ABdhPJxoB0WOyReV7avIFHsHSpBOT0FV94fl1V+SyYHXNLig0LlOZ/MZu87nXpQlGbeDFa+FRneq1w==
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr26692973pfu.27.1651014544089; 
 Tue, 26 Apr 2022 16:09:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050d42864753sm7856490pfl.49.2022.04.26.16.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:09:03 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2  2/5] migration: Add 64bit variable array data type
Date: Tue, 26 Apr 2022 16:08:51 -0700
Message-Id: <20220426230855.336292-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426230855.336292-1-atishp@rivosinc.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 26 Apr 2022 23:09:08 -0000

unsigned 64bit variable array data type support is missing.
Add the required code to support it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/migration/vmstate.h | 11 +++++++++++
 migration/vmstate.c         |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa193451..d289caea0143 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -147,6 +147,7 @@ enum VMStateFlags {
      * VMStateField.struct_version_id to tell which version of the
      * structure we are referencing to use. */
     VMS_VSTRUCT           = 0x8000,
+    VMS_VARRAY_UINT64     = 0x10000,
 };
 
 typedef enum {
@@ -428,6 +429,16 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset     = vmstate_offset_pointer(_state, _field, _type),     \
 }
 
+#define VMSTATE_VARRAY_UINT64(_field, _state, _field_num, _version, _info, _type) {\
+    .name       = (stringify(_field)),                               \
+    .version_id = (_version),                                        \
+    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),\
+    .info       = &(_info),                                          \
+    .size       = sizeof(_type),                                     \
+    .flags      = VMS_VARRAY_UINT64 | VMS_POINTER,                   \
+    .offset     = vmstate_offset_pointer(_state, _field, _type),     \
+}
+
 #define VMSTATE_VARRAY_UINT16_ALLOC(_field, _state, _field_num, _version, _info, _type) {\
     .name       = (stringify(_field)),                               \
     .version_id = (_version),                                        \
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 36ae8b9e1918..3cd5e37ebe2d 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -35,6 +35,8 @@ static int vmstate_n_elems(void *opaque, const VMStateField *field)
         n_elems = *(int32_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT32) {
         n_elems = *(uint32_t *)(opaque + field->num_offset);
+    } else if (field->flags & VMS_VARRAY_UINT64) {
+        n_elems = *(uint64_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT16) {
         n_elems = *(uint16_t *)(opaque + field->num_offset);
     } else if (field->flags & VMS_VARRAY_UINT8) {
-- 
2.25.1


