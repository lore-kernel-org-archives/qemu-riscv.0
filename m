Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIWEX-00020X-IU
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIWEV-0001zp-Oo
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:49:39 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pIWET-0001c0-VJ
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:49:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kt14so6309835ejc.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 06:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+jaBY0vd8rZKNxNRA16s6vpgEoYJM27Ogc9LdyMqxuA=;
 b=R8cNXxKlpt1Y6SCVogtamb0tfc5OPG65yUvex/O3TZni/O8G9VD//NCjV35Hx5NKOU
 RkqPx73hZvSgUSqtil3m/WhpcpHTO0o2TfIq+Y+4r9pMnYObYqiPMZ36LZ5rTCL72lc8
 LGkUrgbHkGkPc5VjcJIk5NMcuosv6/7551Ms84wV3953n957pyXZRqiIktMUJ/W0uZNA
 16fSEEILsVSKlfH4FSnFbAJHDWjHTAg5RvztcZPFUAjfT8eX1b0HjPYLmXCwzv8w1yOD
 R+aFS8ugR5rV/8hjxb6vkYKhaOsp0Zs9cYNy688OsllA1mfN3JkgnaoSPLK3RsVEdo9T
 U9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jaBY0vd8rZKNxNRA16s6vpgEoYJM27Ogc9LdyMqxuA=;
 b=LezjACzrPDf6WJEkXen7cWsRXQrobOjSIi0mb37CTxpzGUUD694GFIaR10h2SbIWYZ
 yloRzgZlvQwEHrPi89WE59fLi5wUQtuEuriW9VITuDMbE/CXRmD/FSC5xLIetWkFbQ+Q
 AaSvI1S8oSPR53QonIhkbKelvnA/jZMFYHXdi54J/Gy2o/co1WZRp0pIshIil3Q1ECDW
 7HuPzoODlmNMnFjowJzivjoZnBEQkR2+zcLkDkZWz1BOVL4eWH9r1J+RKH5Q+WD0SOza
 RnjTvBGWCSPBXtUUs31nzolwNiZQEfbth1Yi1weO7xFqSAKA0y/2K/BoEZQuEkbQfbuI
 TrdA==
X-Gm-Message-State: AFqh2kpTIihb1yWBYrbp6Gga3LTAjtqiTY8AiPu7KerqBBb4/5A7ckE+
 bdFK5IcwsJBZOpXNUal4GghCZ4s6NzTr792d
X-Google-Smtp-Source: AMrXdXuwR+PLX8ivoaxhfViDrmWO3WBJy2+tKiWk20CDlK94OvsJ4rusN1jgYfW6jhC5TVSVJ1+nSg==
X-Received: by 2002:a17:906:1605:b0:870:2f70:c631 with SMTP id
 m5-20020a170906160500b008702f70c631mr14355718ejd.2.1674139776299; 
 Thu, 19 Jan 2023 06:49:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a1709063ec900b007bd9e683639sm16283259ejj.130.2023.01.19.06.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:49:35 -0800 (PST)
Date: Thu, 19 Jan 2023 15:49:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230119144934.ikmij2b7m7yeqwtz@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
 <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 14:49:40 -0000

On Thu, Jan 19, 2023 at 02:00:27PM +0100, Alexandre Ghiti wrote:
> Hi Alistair, Andrew,
> 
> On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > >
> > > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > ...
> > > > > > +
> > > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > > >
> > > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > > accepted as an alias. I think we should simply not define the sv32
> > > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > > riscv_add_satp_mode_properties() we can add some
> > > > >
> > > > >   #if defined(TARGET_RISCV32)
> > > > >   ...
> > > > >   #elif defined(TARGET_RISCV64)
> > > > >   ...
> > > > >   #endif
> > > >
> > > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > > >
> > > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > > CPUs and compile time macros are the wrong solution here. Instead you
> > > > can get the xlen of the hart and use that.
> > > >
> > >
> > > Does this mean we want to be able to do the following?
> > >
> > >   qemu-system-riscv64 -cpu rv32,sv32=on ...
> >
> > That's the plan
> >
> > >
> > > If so, then can we move the object_property_add() for sv32 to
> > > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> > > Currently, that would be doing the same thing as proposed above,
> > > since those functions are under TARGET_RISCV* defines, but I guess
> > > the object_property_add()'s would then be in more or less the right
> > > places for when the 32-bit emulation support work is started.
> >
> > Sounds like a good idea :)
> 
> What about riscv_any_cpu_init and riscv_host_cpu_init?

riscv_host_cpu_init depends on KVM support, so we actually don't need to
add the properties in this patch at all. That's later work. I'm not real
clear as to what riscv_any_cpu_init is. It looks like a cpu type that
tries to enable all supported standard extensions. Maybe we need a patch
like below first and then add the sv* properties in the same way we will
for the rv*_base_cpu_init functions.

Thanks,
drew


diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca76677f..a2987205991e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -229,19 +229,15 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void riscv_any_cpu_init(Object *obj)
-{
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
-#if defined(TARGET_RISCV32)
-    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-#elif defined(TARGET_RISCV64)
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-#endif
-    set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
-}
-
 #if defined(TARGET_RISCV64)
+static void rv64_any_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
+    register_cpu_props(DEVICE(obj));
+}
+
 static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -285,6 +281,14 @@ static void rv128_base_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 #else
+static void rv32_any_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
+    register_cpu_props(DEVICE(obj));
+}
+
 static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -1285,17 +1289,18 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 #if defined(TARGET_RISCV32)
+    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              rv32_any_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
+    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              rv64_any_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),

