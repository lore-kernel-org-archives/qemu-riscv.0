Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE52C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:06:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0Mg-0001x4-JN; Fri, 03 Nov 2023 16:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0LH-0008I1-Cm
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0L4-0005eE-Bj
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso15383545e9.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041613; x=1699646413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3324MOZMoTl1SA1uX2cxDUy5LOgCifBBJDCwAPB5tE=;
 b=EgbqyInq7zK/l9wBVKoLG8RU2uMntk449kiZ3LpEwgA8pDhtENZN3cCAfUfBDgieT+
 79VP+KUTjpDxuPeEOzVWVemYld95ujtviOKT0jUa138kcPHEdoBfg4ibLPu02Ti/Vyqy
 MK+2yPUqcIRjSejseUxolegRYb6f6GBVPPNS3YK8/cAGytg45N+ZR/yPtIt+EntoSG9s
 +aJgihT73UC+nAY6zSyRgvYbvf2hLWLj3FaGz06FdEdzfTop1fkA6jfgkQnBQv25YkI1
 oh3Xar46OffFWZ30dM2lSTBKXUjnQlr/hUffqJ1BoMn1VXrkJuZb/gGyx8Gb0acgVtQ/
 9r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041613; x=1699646413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3324MOZMoTl1SA1uX2cxDUy5LOgCifBBJDCwAPB5tE=;
 b=B0TJG7XJ8ay50XDQNSI7MzGeZBhOj4kQ1xmST5CHO1OqsZNPw6q7/BgFJ6wg2ZMjUR
 sWlMbhOYT6CqalfuKoS5701vPV9A3UzPXfFd7Agcdq+UzBmgaqc+ctko+0fnVXZekoKx
 MFVYgsOIaEu9FMA4OutEEw0dAbdbRZgjY4nxQ3lchnb2ONEcD+rVi8AMW+gStOHOzxBK
 YtVKkAkqL8ig9HK/0LqUK3Uc/09KrVrMnowhCi99/oGtx9n6GpBR2Ow34+PP9lPK7dHE
 /uhu62EoaIsfu/hC/3PzD6IpDispQH+Cqy8bqjVSzUwiWD7U1KeY54v7L1VhPb6A5l/r
 BXkQ==
X-Gm-Message-State: AOJu0YyljWYSSbHywqn1JZFp08u+vm4mpF53/wodyucKpNfZ08ey5Cw2
 oucNxUTMyhWE1YEUJdFmPuraTA==
X-Google-Smtp-Source: AGHT+IGfStfc5zBi0CNgZ/5Oss9uMTZhl654oM+jog7BZLbA07lObKLmooP06SYEBDpOuC+SXmSwAw==
X-Received: by 2002:a05:600c:5488:b0:408:3634:b81e with SMTP id
 iv8-20020a05600c548800b004083634b81emr4756968wmb.13.1699041612983; 
 Fri, 03 Nov 2023 13:00:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b004083a105f27sm3551821wms.26.2023.11.03.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8AEC765756;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 26/29] plugins: add dllexport and dllimport to api funcs
Date: Fri,  3 Nov 2023 19:59:53 +0000
Message-Id: <20231103195956.1998255-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Greg Manning <gmanning@rapitasystems.com>

In qemu-plugin.h, mark all API functions as __declspec(dllexport) when
compiling the executables, and as __declspec(dllimport) when being used
to compile plugins against.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-2-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 52 +++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index e5c16df5ca..785315c06d 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -23,15 +23,18 @@
  *   https://gcc.gnu.org/wiki/Visibility
  */
 #if defined _WIN32 || defined __CYGWIN__
-  #ifdef BUILDING_DLL
-    #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
-  #else
+  #ifdef CONFIG_PLUGIN
     #define QEMU_PLUGIN_EXPORT __declspec(dllimport)
+    #define QEMU_PLUGIN_API __declspec(dllexport)
+  #else
+    #define QEMU_PLUGIN_EXPORT __declspec(dllexport)
+    #define QEMU_PLUGIN_API __declspec(dllimport)
   #endif
   #define QEMU_PLUGIN_LOCAL
 #else
   #define QEMU_PLUGIN_EXPORT __attribute__((visibility("default")))
   #define QEMU_PLUGIN_LOCAL  __attribute__((visibility("hidden")))
+  #define QEMU_PLUGIN_API
 #endif
 
 /**
@@ -148,6 +151,7 @@ typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
  *
  * Note: Calling this function from qemu_plugin_install() is a bug.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
 
 /**
@@ -161,6 +165,7 @@ void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
  * Plugins are reset asynchronously, and therefore the given plugin receives
  * callbacks until @cb is called.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
 
 /**
@@ -172,6 +177,7 @@ void qemu_plugin_reset(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb);
  *
  * See also: qemu_plugin_register_vcpu_exit_cb()
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
@@ -184,6 +190,7 @@ void qemu_plugin_register_vcpu_init_cb(qemu_plugin_id_t id,
  *
  * See also: qemu_plugin_register_vcpu_init_cb()
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
@@ -194,6 +201,7 @@ void qemu_plugin_register_vcpu_exit_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a vCPU idles.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
                                        qemu_plugin_vcpu_simple_cb_t cb);
 
@@ -204,6 +212,7 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a vCPU resumes execution.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb);
 
@@ -254,6 +263,7 @@ typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
  * callbacks to be triggered when the block or individual instruction
  * executes.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb);
 
@@ -266,6 +276,7 @@ void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
  *
  * The @cb function is called every time a translated unit executes.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           qemu_plugin_vcpu_udata_cb_t cb,
                                           enum qemu_plugin_cb_flags flags,
@@ -297,6 +308,7 @@ enum qemu_plugin_op {
  * Note: ops are not atomic so in multi-threaded/multi-smp situations
  * you will get inexact results.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
                                               void *ptr, uint64_t imm);
@@ -310,6 +322,7 @@ void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
  *
  * The @cb function is called every time an instruction is executed
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
                                             qemu_plugin_vcpu_udata_cb_t cb,
                                             enum qemu_plugin_cb_flags flags,
@@ -325,6 +338,7 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
  * Insert an inline op to every time an instruction executes. Useful
  * if you just want to increment a single counter somewhere in memory.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
                                                 enum qemu_plugin_op op,
                                                 void *ptr, uint64_t imm);
@@ -335,6 +349,7 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
  *
  * Returns: number of instructions in this block
  */
+QEMU_PLUGIN_API
 size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
 
 /**
@@ -343,6 +358,7 @@ size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
  *
  * Returns: virtual address of block start
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
 
 /**
@@ -356,6 +372,7 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
  *
  * Returns: opaque handle to instruction
  */
+QEMU_PLUGIN_API
 struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
 
@@ -369,6 +386,7 @@ qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
  * Returns: pointer to a stream of bytes containing the value of this
  * instructions opcode.
  */
+QEMU_PLUGIN_API
 const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
 
 /**
@@ -377,6 +395,7 @@ const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
  *
  * Returns: size of instruction in bytes
  */
+QEMU_PLUGIN_API
 size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
 
 /**
@@ -385,6 +404,7 @@ size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
  *
  * Returns: virtual address of instruction
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
 
 /**
@@ -393,6 +413,7 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
  *
  * Returns: hardware (physical) target address of instruction
  */
+QEMU_PLUGIN_API
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
 /**
@@ -411,6 +432,7 @@ struct qemu_plugin_hwaddr;
  *
  * Returns: size of access in ^2 (0=byte, 1=16bit, 2=32bit etc...)
  */
+QEMU_PLUGIN_API
 unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
 /**
  * qemu_plugin_mem_is_sign_extended() - was the access sign extended
@@ -418,6 +440,7 @@ unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
  *
  * Returns: true if it was, otherwise false
  */
+QEMU_PLUGIN_API
 bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
 /**
  * qemu_plugin_mem_is_big_endian() - was the access big endian
@@ -425,6 +448,7 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
  *
  * Returns: true if it was, otherwise false
  */
+QEMU_PLUGIN_API
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
 /**
  * qemu_plugin_mem_is_store() - was the access a store
@@ -432,6 +456,7 @@ bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
  *
  * Returns: true if it was, otherwise false
  */
+QEMU_PLUGIN_API
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
 /**
@@ -447,6 +472,7 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
  * information about the handle should be recovered before the
  * callback returns.
  */
+QEMU_PLUGIN_API
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
@@ -463,6 +489,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
  * Returns true if the handle's memory operation is to memory-mapped IO, or
  * false if it is to RAM
  */
+QEMU_PLUGIN_API
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
 
 /**
@@ -474,12 +501,14 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
  * Note that the returned physical address may not be unique if you are dealing
  * with multiple address spaces.
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
 
 /*
  * Returns a string representing the device. The string is valid for
  * the lifetime of the plugin.
  */
+QEMU_PLUGIN_API
 const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
 
 /**
@@ -514,6 +543,7 @@ typedef void (*qemu_plugin_vcpu_mem_cb_t) (unsigned int vcpu_index,
  * callback so the plugin is responsible for ensuring it doesn't get
  * confused by making appropriate use of locking if required.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
                                       qemu_plugin_vcpu_mem_cb_t cb,
                                       enum qemu_plugin_cb_flags flags,
@@ -532,6 +562,7 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plugin_insn *insn,
  * instruction. This provides for a lightweight but not thread-safe
  * way of counting the number of operations done.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
                                           enum qemu_plugin_mem_rw rw,
                                           enum qemu_plugin_op op, void *ptr,
@@ -545,6 +576,7 @@ typedef void
                                  uint64_t a3, uint64_t a4, uint64_t a5,
                                  uint64_t a6, uint64_t a7, uint64_t a8);
 
+QEMU_PLUGIN_API
 void qemu_plugin_register_vcpu_syscall_cb(qemu_plugin_id_t id,
                                           qemu_plugin_vcpu_syscall_cb_t cb);
 
@@ -552,6 +584,7 @@ typedef void
 (*qemu_plugin_vcpu_syscall_ret_cb_t)(qemu_plugin_id_t id, unsigned int vcpu_idx,
                                      int64_t num, int64_t ret);
 
+QEMU_PLUGIN_API
 void
 qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_syscall_ret_cb_t cb);
@@ -564,6 +597,7 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
  * Returns an allocated string containing the disassembly
  */
 
+QEMU_PLUGIN_API
 char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
 
 /**
@@ -573,6 +607,7 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
  * Return a static string referring to the symbol. This is dependent
  * on the binary QEMU is running having provided a symbol table.
  */
+QEMU_PLUGIN_API
 const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
 
 /**
@@ -584,9 +619,11 @@ const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
  *
  * See also: qemu_plugin_register_vcpu_init_cb()
  */
+QEMU_PLUGIN_API
 void qemu_plugin_vcpu_for_each(qemu_plugin_id_t id,
                                qemu_plugin_vcpu_simple_cb_t cb);
 
+QEMU_PLUGIN_API
 void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
                                    qemu_plugin_simple_cb_t cb);
 
@@ -603,6 +640,7 @@ void qemu_plugin_register_flush_cb(qemu_plugin_id_t id,
  * In user-mode it is possible a few un-instrumented instructions from
  * child threads may run before the host kernel reaps the threads.
  */
+QEMU_PLUGIN_API
 void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
@@ -616,6 +654,7 @@ int qemu_plugin_n_max_vcpus(void);
  * qemu_plugin_outs() - output string via QEMU's logging system
  * @string: a string
  */
+QEMU_PLUGIN_API
 void qemu_plugin_outs(const char *string);
 
 /**
@@ -629,6 +668,7 @@ void qemu_plugin_outs(const char *string);
  * returns true if the combination @name=@val parses correctly to a boolean
  * argument, and false otherwise
  */
+QEMU_PLUGIN_API
 bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
 
 /**
@@ -639,6 +679,7 @@ bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
  * return NULL. The user should g_free() the string once no longer
  * needed.
  */
+QEMU_PLUGIN_API
 const char *qemu_plugin_path_to_binary(void);
 
 /**
@@ -647,6 +688,7 @@ const char *qemu_plugin_path_to_binary(void);
  * Returns the nominal start address of the main text segment in
  * user-mode. Currently returns 0 for system emulation.
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_start_code(void);
 
 /**
@@ -655,6 +697,7 @@ uint64_t qemu_plugin_start_code(void);
  * Returns the nominal end address of the main text segment in
  * user-mode. Currently returns 0 for system emulation.
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_end_code(void);
 
 /**
@@ -663,6 +706,7 @@ uint64_t qemu_plugin_end_code(void);
  * Returns the nominal entry address of the main text segment in
  * user-mode. Currently returns 0 for system emulation.
  */
+QEMU_PLUGIN_API
 uint64_t qemu_plugin_entry_code(void);
 
 /** struct qemu_plugin_register - Opaque handle for a translated instruction */
@@ -692,6 +736,7 @@ typedef struct {
  * start you should call this from a qemu_plugin_register_vcpu_init_cb()
  * callback.
  */
+QEMU_PLUGIN_API
 GArray * qemu_plugin_find_registers(unsigned int vcpu_index, const char *reg_pattern);
 
 /**
@@ -707,6 +752,7 @@ GArray * qemu_plugin_find_registers(unsigned int vcpu_index, const char *reg_pat
  * Returns the size of the read register. The content of @buf is in target byte
  * order. On failure returns -1
  */
+QEMU_PLUGIN_API
 int qemu_plugin_read_register(unsigned int vcpu,
                               struct qemu_plugin_register *handle,
                               GByteArray *buf);
-- 
2.39.2


