Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2E6C9833E
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:22:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3o5-0003QR-7m; Mon, 28 Sep 2026 01:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3nn-0003KK-KV
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:26 -0400
Received: from mail-dl2-x2b.google.com ([2607:f8b0:4864:38::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3nl-0007ln-02
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:23 -0400
Received: by mail-dl2-x2b.google.com with SMTP id
 a92af1059eb24-1438cb9b3a3so1408913c88.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572880; x=1791177680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q9Wafx0aXX2Ni1bBJzRLIBOxNOLdNJdd9ggXabMSVEY=;
 b=BnV6i6kFt8Y+JqHVKVHuMvivV4ql/mOt78oHBBtf3DNHyGfbm8UoTjoTd8MYIU4wuF
 PLs5kI6BTnEGKgK+9uuqzu5El39S5OUUw2C4VYYipTEpvaWnk8svqnS+UvFXXB8TTldB
 +2k7H07vkixAlSemFjmRSt+gxgh+QoCmHuNWyLIr5HpneghpJ4kPWYkEq7nHxXo4xxOX
 J4Fk3Ly47pG5Vd/AgoDDgtC9ePWNSiGsTjQoYiABQSSXmIfkpngno0foMLi5comdOofl
 dzqeKdvcPg3H4koo21L8U6AaQbLkuf44zdkNJVQuPe4nRhNsRjVmn715CcALCh704+8u
 6GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572880; x=1791177680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q9Wafx0aXX2Ni1bBJzRLIBOxNOLdNJdd9ggXabMSVEY=;
 b=eGAXPxv14vmKB11lJqHEdVWgASi0GXXwxKS+8X8Cku4/Ysi5p46aXJUkGd4H75obBj
 7LL+QyVETJnCtUoDS4tcBNg2/d4xpbLMnALIqVHd4bnggxoCLK++NAQXyjc9JBXIzS5I
 fGR523WQXFS3H6HW1kGyeivFB5o1gQ01SWGld/G51/96U9gg+ylM/2UzmMxf3yxl5mxm
 VClBnI/xrpuzzhcRIxGicF3J0tWNifbDbZ3SDMSJJ5+UppRI1tTDKfUouAN9BAErCpvX
 TlEQ8B6QKp3ngo4hR+xCGze+KCnZiLiLhAP5KjLk5mY9NwsqOrF0jRkVssCkg/i6wn2U
 Ca+A==
X-Forwarded-Encrypted: i=1;
 AKwUvByYYvf6YEec7YCqpvIM4LtfdjURPCnKINK0Ohjm48hFLaoQc3cvcM6r0VYAriNYLX5jS7i3ujzHmNM6@nongnu.org
X-Gm-Message-State: AFuF++na9IVz4wwZbZwZfeRKGe1smP04bvTttwdHybzZvVooQEppgWF/
 AiCX1Q1BCNd+AWVtlxd3YO+ylIpNzFQIW8ijvVk7mQSCPsg1zN6Scv15
X-Gm-Gg: AYBFou1kQjE13pJbzccd6776y9J9OxFtGBqqAwEK4IEmET942NYYW95IpTY2Tg2okoB
 6MDAroi8hlF9KQJ4NgFVpTF7D+VVn1Kw6Ur4Qo8q6RRrp5BfMLNpbFFQE/K/AGlmtoMeJKMTnhu
 PY63txlOCI3/l1eN9H49A4l0MtcxZE86NPu1NkKXXERhU9nNKECgs5S/zNWAW5jDOWhQYkL31wZ
 7TXWf0vFBnOnKD0i19wPkhvAktWHcFCpwY7/W7pDuroLobTIBF31nse0m5g3ZwKP6xoGVdOLalu
 uvSyycHUKww0pkYpqB6SzhTzxrgqOdlN/jny6P56j6CS92HTF/rhjYGAbX8kImDtfT5bS7Vb0fl
 mCVpbzSlde7T61rX+88TiMPcyq0g2oGZHEftUSxbmoUKLmi+JliPQiEI4IiHf9/UmFNKnHLho2r
 m5LfFAn+TdvRirQVHg6ngfQXL0x9OMojxcDnaauWn7S+4uDIsRa/RzI6NxJeQIK2BYpZ2zktwjw
 YpGaX07gP8OoY2fvaN51Z3+oOuunss=
X-Received: by 2002:a05:7022:1588:b0:147:5149:d108 with SMTP id
 a92af1059eb24-1475149db52mr8939208c88.43.1790572879456; 
 Sun, 27 Sep 2026 22:21:19 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:18 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
Date: Mon, 28 Sep 2026 13:20:28 +0800
Message-ID: <20260928052051.251-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::2b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
cpu->exception_index, then restore and exit the current TB the same
way as cpu_loop_exit_restore.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/tcg/cpu-exec-common.c  |  6 ++++++
 include/accel/tcg/cpu-loop.h | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index d20cece1c5f..31fed8e497f 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
     cpu_loop_exit(cpu);
 }
 
+void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t pc)
+{
+    cpu->exception_index = exception_index;
+    cpu_loop_exit_restore(cpu, pc);
+}
+
 void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
 {
     /* Prevent looping if already executing in a serial context. */
diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.h
index f4d38bc2bca..856091020f2 100644
--- a/include/accel/tcg/cpu-loop.h
+++ b/include/accel/tcg/cpu-loop.h
@@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_pc);
 G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc);
 
+/**
+ * cpu_loop_exit_excp:
+ * @cpu: the cpu context
+ * @exception_index: EXCP_* or target trap number
+ * @host_pc: the host pc within the translation
+ *
+ * Set cpu->exception_index and exit the current TB, restoring
+ * guest state from @host_pc the same way as cpu_loop_exit_restore.
+ */
+G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
+                                   uintptr_t host_pc);
+
 /**
  * cpu_loop_exit:
  * @cpu: the cpu context
-- 
2.52.0.windows.1


