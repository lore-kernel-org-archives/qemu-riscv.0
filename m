Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLpOR-0008Ca-91
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 12:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOK-000838-88; Thu, 02 Sep 2021 12:16:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOI-00012p-RA; Thu, 02 Sep 2021 12:16:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m9so3853363wrb.1;
 Thu, 02 Sep 2021 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXa1glKBQAZuhiqfHx9McrLJH+6vsqw3g1Zly0CLLW4=;
 b=ae0rJedtnyFXXpMPGaAYczb7D2gf5sAIBD78JSrM21inhCc6oobXicz8ZrAZbwKo+u
 LWgigyv/HdAEIiac6GDnYpFFEaYaskd9kEYeEtmG6nZ6xqWdpNpJ01xQm8qn97nDsycD
 JxK3rpivyOqG1ZF86VDCnWe7LDsUSWz4wzcJ/hvTp90Ehm2lEwn32lLuy6xZI/8yyuGo
 D3grkzcyRTx5k7pQjKg/3FGCaby6/Z3ejv2o7bs/xAAYUcfve3y2UqEM+TGGHH5UOrhG
 CAAu0Bd2wdhdwYLKumOwKFsEqKQ4OFbQ7TMnB4Cn4EM6ysG1/AHT1p0+QcU+g0Nj2W20
 hOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eXa1glKBQAZuhiqfHx9McrLJH+6vsqw3g1Zly0CLLW4=;
 b=Xjnv+g/FWclx2nXGTzRcwGtwcsGkB1vWZodC5D9RgmVlOsjkaliYWLObi2hdh+N+lX
 pFAK7/DF0lWNp8Gko0iD59Va/qyNLlSiQyRINMGp5sew3echqfwoSVe8Xc67pWrgmeZQ
 VW3CRRiFshCzdFekRG/2FxvQJPT8ml0p4C8g0niDZjNNAXXzq48CQ/kO6SAhos7JNSIs
 Lnhb80rwGErgVeFZhBuW+jDejLiHmpt5xfYajsOgWf2fDXIjqJpe4sNlDWWK1+LmZcFJ
 CJUaDN+mhmhp5KD0Po+ZBm4l8Ke6VkSz2EqU4iu9UX8oRYzAVVunQdccjzqKoGDv27F5
 5+Vg==
X-Gm-Message-State: AOAM53321JxuhLuV3yMOz3E9nh1sXtQQFUcdgxUyBABfMuj5FZ49TruA
 PCGjZmQkfG61Qtdn9UZhQc3TFib78eU=
X-Google-Smtp-Source: ABdhPJzKZc/XQ+fV0m19x1zrzrTnVXlm9/5kK9IV3yDSnB/JNoam4AlRGKu+3WZKYWOwLNVhMsbvNg==
X-Received: by 2002:a05:6000:10:: with SMTP id
 h16mr4754013wrx.24.1630599394935; 
 Thu, 02 Sep 2021 09:16:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d9sm2161496wrm.21.2021.09.02.09.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-arm@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stafford Horne <shorne@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 08/30] target/alpha: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:21 +0200
Message-Id: <20210902161543.417092-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Sep 2021 16:16:45 -0000

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb4..32cf5a2ea9f 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.31.1


