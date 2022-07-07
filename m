Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9VAz-0004sV-Es
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jul 2022 13:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9VAw-0004rm-Cv
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 13:20:26 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9VAu-0004Ou-7z
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 13:20:26 -0400
Received: by mail-pg1-x534.google.com with SMTP id z14so19756980pgh.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Jul 2022 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7l3OyRQF4jExyMQe7zeFEVUk3lb2PZUMnFo/DDRjEwc=;
 b=Hd83+UDAYD0CTwaD6odq4JUa+W7eRYMOFRxT59Aa0bXpdDr3oX34gGdjs4g08xjLfk
 LSMvhjVmL9YhnKeQWYbPYjtkctstC7qUH58lG4F0ApmCNvQhzrjlYHQxs7Cmlzn/RIvY
 JNi/RLTN/cs4hUVw24xsSNOP++LwU91MBclokpaitgL7DOsVUxE5qzBNWBmbJUypElmm
 YKico+csVRFJ84Np7yNP18isD5w5H9Dgzt7cVzw76wRoRYiBo0EPOES+/MLLjMfWNScA
 3KDl81nFK094oCydiWRU6ZwezPzHw/nMN0SjZLNs5gjwyUsBZNpJtZoyox4opGfaX9n4
 raKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7l3OyRQF4jExyMQe7zeFEVUk3lb2PZUMnFo/DDRjEwc=;
 b=l5h+qeMC7YqCabDC9kYCdigAEJicKV5Ol+3HwRqGJnX5PdyDoKmHCDgrISuBiT2YTm
 RIJmqKeCvgAQwZqnj2Q48craZ0cOhWLOcMnkvG/6IEtf7l1FlK/ATX/s2RakN6KbdzZ3
 UBbU+IArTOnK0+gGwIAQeF97f0jvBNKqUO4tVdd96kKsKjKLdEU9SrggLM1485gzMBAk
 aLN9eLJljp1NaKgCDze28XNudnBPMzA9da0Jl8s80ZOZK1Pzj4L/GQnGH65wRdvpJnBo
 UpQnuYdP98Ka1IzLlwbawFiCCYU7C58E67AcYIG1U4Eh4bEPiLVQ0su2iDSnnr++DCrD
 wX9A==
X-Gm-Message-State: AJIora//4dqYBllGROIznspEPC6wvv8NspaOC11RjSu28RSE7+Zc12v/
 XjVA4PYEZhFiXF1B1YEfgjNnFA==
X-Google-Smtp-Source: AGRyM1trZYFG6mQzCXqRwmYC4yoPLr60sNMXQl7XMvRaac92fdye7IzZNimRxAVQvX2zTZc6vix5pg==
X-Received: by 2002:a17:90a:1485:b0:1ec:788e:a053 with SMTP id
 k5-20020a17090a148500b001ec788ea053mr6190733pja.16.1657214421977; 
 Thu, 07 Jul 2022 10:20:21 -0700 (PDT)
Received: from [192.168.1.18] ([182.64.106.38])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b00168c52319c3sm28144653pln.149.2022.07.07.10.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:20:21 -0700 (PDT)
Message-ID: <f1da6f0a0a566badeadc95527457d6e0afe57a9f.camel@ventanamicro.com>
Subject: Re: [RFC PATCH v5 2/4] target/riscv: smstateen check for h/senvcfg
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: angell1518 <angell1518@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Date: Thu, 07 Jul 2022 22:50:14 +0530
In-Reply-To: <35f3afa1.21b5.181be7970fc.Coremail.angell1518@163.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-3-mchitale@ventanamicro.com>
 <35f3afa1.21b5.181be7970fc.Coremail.angell1518@163.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 07 Jul 2022 17:20:26 -0000

On Sat, 2022-07-02 at 18:33 +0800, angell1518 wrote:
> At 2022-06-04 00:04:23, "Mayuresh Chitale" <mchitale@ventanamicro.com
> > wrote:
> >Accesses to henvcfg, henvcfgh and senvcfg are allowed
> >only if corresponding bit in mstateen0/hstateen0 is
> >enabled. Otherwise an illegal instruction trap is
> >generated.
> >
> >Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >---
> > target/riscv/csr.c | 84 ++++++++++++++++++++++++++++++++++++++++++-
> ---
> > 1 file changed, 78 insertions(+), 6 deletions(-)
> >
> >diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >index 324fefce59..ae91ae1f7e 100644
> >--- a/target/riscv/csr.c
> >+++ b/target/riscv/csr.ccounteren
> >@@ -39,6 +39,37 @@ void riscv_set_csr_ops(int csrno,
> riscv_csr_operations *ops)
> > }
> > 
> > /* Predicates */
> >+static RISCVException smstateen_acc_ok(CPURISCVState *env, int
> mode, int bit)
> >+{
> >+    CPUState *cs = env_cpu(env);
> >+    RISCVCPU *cpu = RISCV_CPU(cs);
> >+    bool virt = riscv_cpu_virt_enabled(env);
> >+
> >+    if (!cpu->cfg.ext_smstateen) {
> >+        return RISCV_EXCP_NONE;
> >+    }
> >+
> >+#if !defined(CONFIG_USER_ONLY)
> >+    if (!(env->mstateen[0] & 1UL << bit)) {
> >+        return RISCV_EXCP_ILLEGAL_INST;
> >+    }
> >+
> I think mstateen only control access in priv mode under M mode.  
> So we should take the current priv node into consideration here.

For any curent priv mode if the required bit is not set in mstateen we
can return here itself. For e.g if current priv mode is S then we only
check the required bit in mstateen. If current priv mode is 'U', we
need to check the required bit in mstateen and sstateen

> >+    if (virt) {
> >+        if (!(env->hstateen[0] & 1UL << bit)) {
> >+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >+        }
> >+    }
> >+
> >+    if (mode == PRV_U) {
> >+        if (!(env->sstateen[0] & 1UL << bit)) {
> >+            return RISCV_EXCP_ILLEGAL_INST;
> >+ }
> I think there are two problem here:
> The first is that we should also take virt mode into consideration
> here too. 
Actually virt mode is considered above for both priv modes S and U.
> As the spec said: 
> "if executing in VS or VU mode and the circumstances for a virtual
> instruction
> exception apply, raises a virtual instruction exception instead of an
> illegal instruction exception"
> So it will generate RISCV_EXCP_VIRT_INSTRUCTION_FAULT in VU mode.

> 
> The second is that sstateen csr works only when 'S' extension is
> enabled
> 
I will fix it in the next version.

> Regards,
> Weiwei Li
> >+    }
> >+#endif
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> > static RISCVException fs(CPURISCVState *env, int csrno)
> > {
> > #if !defined(CONFIG_USER_ONLY)
> >@@ -1557,6 +1588,13 @@ static RISCVException
> write_menvcfgh(CPURISCVState *env, int csrno,
> > static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> >                                  target_ulong *val)
> > {
> >+    RISCVException ret;
> >+
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> >+
> >     *val = env->senvcfg;
> >     return RISCV_EXCP_NONE;
> > }
> >@@ -1565,15 +1603,27 @@ static RISCVException
> write_senvcfg(CPURISCVState *env, int csrno,
> >                                   target_ulong val)
> > {
> >     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE |
> SENVCFG_CBZE;
> >+    RISCVException ret;
> > 
> >-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> > 
> >+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> >     return RISCV_EXCP_NONE;
> > }
> > 
> > static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> >                                  target_ulong *val)
> > {
> >+    RISCVException ret;
> >+
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> >+
> >     *val = env->henvcfg;
> >     return RISCV_EXCP_NONE;
> > }
> >@@ -1582,6 +1632,12 @@ static RISCVException
> write_henvcfg(CPURISCVState *env, int csrno,
> >                                   target_ulong val)
> > {
> >     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE |
> HENVCFG_CBZE;
> >+    RISCVException ret;
> >+
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> > 
> >     if (riscv_cpu_mxl(env) == MXL_RV64) {
> >         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> >@@ -1595,6 +1651,13 @@ static RISCVException
> write_henvcfg(CPURISCVState *env, int csrno,
> > static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> >                                  target_ulong *val)
> > {
> >+    RISCVException ret;
> >+
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> >+
> >     *val = env->henvcfg >> 32;
> >     return RISCV_EXCP_NONE;
> > }
> >@@ -1604,9 +1667,14 @@ static RISCVException
> write_henvcfgh(CPURISCVState *env, int csrno,
> > {
> >     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> >     uint64_t valh = (uint64_t)val << 32;
> >+    RISCVException ret;
> > 
> >-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> >+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
> >+    if (ret != RISCV_EXCP_NONE) {
> >+        return ret;
> >+    }
> > 
> >+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> >     return RISCV_EXCP_NONE;
> > }
> > 
> >@@ -1628,7 +1696,8 @@ static RISCVException
> write_mstateen(CPURISCVState *env, int csrno,
> >                                      target_ulong new_val)
> > {
> >     uint64_t *reg;
> >-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> >+                       (1UL << SMSTATEEN0_HSENVCFG);
> > 
> >     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> >     write_smstateen(env, reg, wr_mask, new_val);
> >@@ -1649,7 +1718,8 @@ static RISCVException
> write_mstateenh(CPURISCVState *env, int csrno,
> > {
> >     uint64_t *reg;
> >     uint64_t val;
> >-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> >+                       (1UL << SMSTATEEN0_HSENVCFG);
> > 
> >     reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> >     val = (uint64_t)new_val << 32;
> >@@ -1671,7 +1741,8 @@ static RISCVException
> write_hstateen(CPURISCVState *env, int csrno,
> >                                      target_ulong new_val)
> > {
> >     uint64_t *reg;
> >-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> >+                       (1UL << SMSTATEEN0_HSENVCFG);
> >     int index = csrno - CSR_HSTATEEN0;
> > 
> >     reg = &env->hstateen[index];
> >@@ -1694,8 +1765,9 @@ static RISCVException
> write_hstateenh(CPURISCVState *env, int csrno,
> > {
> >     uint64_t *reg;
> >     uint64_t val;
> >-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >     int index = csrno - CSR_HSTATEEN0H;
> >+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
> >+                       (1UL << SMSTATEEN0_HSENVCFG);
> > 
> >     reg = &env->hstateen[index];
> >     val = (uint64_t)new_val << 32;
> >-- 
> >2.25.1
> >


