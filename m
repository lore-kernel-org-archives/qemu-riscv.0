Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C6C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:25:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVZQr-0000cZ-Iv; Mon, 14 Aug 2023 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZQ5-0000Xa-Tn
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:23:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZQ0-0002HB-KX
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:23:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-319559fd67dso3205878f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692026623; x=1692631423;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9soZxIZoTKBilA2PKGZQSZ7seGo6pXX29as05URMbxE=;
 b=hpulCVmQWYHNLFtvyvLz+H9Jo+4qniu2zkOoQzur+NaeD7HxzZApMzXaHL2rMQgIQQ
 QPTgtfhsTbK3sWU+gBvfP05E9jyBEoQJKrkVN3u9IleYPbSgNZfUqWEAyCEw1aSKlyiW
 YXcpta3Y9bbZdkxkq/GWfD6nAEuDzqRJG3nCAfHRSAYw0eAn1/tPGH5Q0jmJUDLdgGH3
 3BygBiq38v98xOk/ryxk7X6NhtRBUUw58+80pWCO1BpSkgud+7cxEFhOKjJOmlCh1XKg
 Y8dmp0cD8vctQX8rL8rz5DmF9+9GqRncj7vUGN4iGytgoFpYjgG205HSK8nOlcB1Ympe
 DWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692026623; x=1692631423;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9soZxIZoTKBilA2PKGZQSZ7seGo6pXX29as05URMbxE=;
 b=bHlAzoVvZxm+mGixDZyiFuhiDY8MtaqGGEfeLa+Pq91tC2ABNZr5vYEwmVhksHG/ZV
 EhtOtcc87Rv42p/E31U6FYzdrm5CI6jiF2p1Qfztjh2qUyaT8DBsbK7l3SK0pAxrl04T
 sv2A/JlCD4oBg+sbuh1mOxlHo3EwCH7iGoExsGcpryKsgWeRytHpVp/Cq9Dr0FxVUIbr
 088HWN/zvDggtgl/dLUf4vNkuDPln3FnTNOpr4yR/4/lzpQiXpnOSzOopFnd1i8KPopx
 JWrf2lN365eltdRkAzr2LFumdYJJPmkLweVh6mymOX/8XZpOHGZXJ28ngi7cdaK3bcXu
 G6qg==
X-Gm-Message-State: AOJu0YxK+u0V4Tr7I8lyfiCtWacu2GwIEjShSKdOnVojGAiK1v1tpE7+
 XgywQx8eOZ1BRaGZKSre1KCtUg==
X-Google-Smtp-Source: AGHT+IGF8rYifFWxWOSYgkZnmMovfD9GIMuL5nIW0C1elLuM3/4SgtaMU05hEY3o/wxuHQ48WeLVAw==
X-Received: by 2002:adf:f8ce:0:b0:317:6edb:6138 with SMTP id
 f14-20020adff8ce000000b003176edb6138mr8161893wrq.62.1692026622784; 
 Mon, 14 Aug 2023 08:23:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b003143c9beeaesm14735998wrr.44.2023.08.14.08.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 08:23:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5DF21FFBB;
 Mon, 14 Aug 2023 16:23:41 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-23-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 22/24] contrib/plugins: Allow to log registers
Date: Mon, 14 Aug 2023 16:21:15 +0100
In-reply-to: <20230731084354.115015-23-akihiko.odaki@daynix.com>
Message-ID: <87ttt1ps02.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This demonstrates how a register can be read from a plugin.

I think it would be a little more useful as a demo if it tracked changes
to the register state rather than dumping it for every line executed.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  docs/devel/tcg-plugins.rst |  10 ++-
>  contrib/plugins/execlog.c  | 130 ++++++++++++++++++++++++++++---------
>  2 files changed, 108 insertions(+), 32 deletions(-)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 81dcd43a61..c9f8b27590 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -497,6 +497,15 @@ arguments if required::
>    $ qemu-system-arm $(QEMU_ARGS) \
>      -plugin ./contrib/plugins/libexeclog.so,ifilter=3Dst1w,afilter=3D0x4=
0001808 -d plugin
>=20=20
> +This plugin can also dump a specified register. The specification of reg=
ister
> +follows `GDB standard target features <https://sourceware.org/gdb/online=
docs/gdb/Standard-Target-Features.html>`__.
> +
> +Specify the name of the feature that contains the register and the name =
of the
> +register with ``rfile`` and ``reg`` options, respectively::
> +
> +  $ qemu-system-arm $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libexeclog.so,rfile=3Dorg.gnu.gdb.arm.core=
,reg=3Dsp -d plugin
> +
>  - contrib/plugins/cache.c
>=20=20
>  Cache modelling plugin that measures the performance of a given L1 cache
> @@ -583,4 +592,3 @@ The following API is generated from the inline docume=
ntation in
>  include the full kernel-doc annotations.
>=20=20
>  .. kernel-doc:: include/qemu/qemu-plugin.h
> -
> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
> index ce67acf145..031ad67fbb 100644
> --- a/contrib/plugins/execlog.c
> +++ b/contrib/plugins/execlog.c
> @@ -15,27 +15,42 @@
>=20=20
>  #include <qemu-plugin.h>
>=20=20
> +typedef struct CPU {
> +    /* Store last executed instruction on each vCPU as a GString */
> +    GString *last_exec;
> +    GByteArray *reg_buf;
> +
> +    int reg;
> +} CPU;
> +
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>=20=20
> -/* Store last executed instruction on each vCPU as a GString */
> -static GPtrArray *last_exec;
> +static CPU *cpus;
> +static int num_cpus;
>  static GRWLock expand_array_lock;
>=20=20
>  static GPtrArray *imatches;
>  static GArray *amatches;
>=20=20
> +static char *rfile_name;
> +static char *reg_name;
> +
>  /*
> - * Expand last_exec array.
> + * Expand cpu array.
>   *
>   * As we could have multiple threads trying to do this we need to
>   * serialise the expansion under a lock.
>   */
> -static void expand_last_exec(int cpu_index)
> +static void expand_cpu(int cpu_index)
>  {
> -    g_rw_lock_writer_unlock(&expand_array_lock);
> -    while (cpu_index >=3D last_exec->len) {
> -        GString *s =3D g_string_new(NULL);
> -        g_ptr_array_add(last_exec, s);
> +    g_rw_lock_writer_lock(&expand_array_lock);
> +    if (cpu_index >=3D num_cpus) {
> +        cpus =3D g_realloc_n(cpus, cpu_index + 1, sizeof(*cpus));
> +        while (cpu_index >=3D num_cpus) {
> +            cpus[num_cpus].last_exec =3D g_string_new(NULL);
> +            cpus[num_cpus].reg_buf =3D g_byte_array_new();
> +            num_cpus++;
> +        }
>      }
>      g_rw_lock_writer_unlock(&expand_array_lock);
>  }
> @@ -50,8 +65,8 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugi=
n_meminfo_t info,
>=20=20
>      /* Find vCPU in array */
>      g_rw_lock_reader_lock(&expand_array_lock);
> -    g_assert(cpu_index < last_exec->len);
> -    s =3D g_ptr_array_index(last_exec, cpu_index);
> +    g_assert(cpu_index < num_cpus);
> +    s =3D cpus[cpu_index].last_exec;
>      g_rw_lock_reader_unlock(&expand_array_lock);
>=20=20
>      /* Indicate type of memory access */
> @@ -77,28 +92,35 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plu=
gin_meminfo_t info,
>   */
>  static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>  {
> -    GString *s;
> +    CPU cpu;
> +    int n;
> +    int i;
>=20=20
>      /* Find or create vCPU in array */
>      g_rw_lock_reader_lock(&expand_array_lock);
> -    if (cpu_index >=3D last_exec->len) {
> -        g_rw_lock_reader_unlock(&expand_array_lock);
> -        expand_last_exec(cpu_index);
> -        g_rw_lock_reader_lock(&expand_array_lock);
> -    }
> -    s =3D g_ptr_array_index(last_exec, cpu_index);
> +    cpu =3D cpus[cpu_index];
>      g_rw_lock_reader_unlock(&expand_array_lock);
>=20=20
>      /* Print previous instruction in cache */
> -    if (s->len) {
> -        qemu_plugin_outs(s->str);
> +    if (cpu.last_exec->len) {
> +        qemu_plugin_outs(cpu.last_exec->str);
>          qemu_plugin_outs("\n");
>      }
>=20=20
>      /* Store new instruction in cache */
>      /* vcpu_mem will add memory access information to last_exec */
> -    g_string_printf(s, "%u, ", cpu_index);
> -    g_string_append(s, (char *)udata);
> +    g_string_printf(cpu.last_exec, "%u, ", cpu_index);
> +    g_string_append(cpu.last_exec, (char *)udata);
> +
> +    if (cpu.reg >=3D 0) {
> +        g_string_append(cpu.last_exec, ", reg,");
> +        n =3D qemu_plugin_read_register(cpu.reg_buf, cpu.reg);
> +        for (i =3D 0; i < n; i++) {
> +            g_string_append_printf(cpu.last_exec, " 0x%02X",
> +                                   cpu.reg_buf->data[i]);
> +        }

so instead of:

  0, 0x4001b4, 0xd10043ff, "sub sp, sp, #0x10", reg, 0x70 0xFF 0x7F 0x00 0x=
00 0x40 0x00 0x00

we could aim for something like:

  0, 0x4001b4, 0xd10043ff, "sub sp, sp, #0x10", sp =3D> 0x70ff7f0000400000


> +        g_byte_array_set_size(cpu.reg_buf, 0);
> +    }
>  }
>=20=20
>  /**
> @@ -167,8 +189,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struc=
t qemu_plugin_tb *tb)
>                                               QEMU_PLUGIN_MEM_RW, NULL);
>=20=20
>              /* Register callback on instruction */
> -            qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
> -                                                   QEMU_PLUGIN_CB_NO_REG=
S, output);
> +            qemu_plugin_register_vcpu_insn_exec_cb(
> +                insn, vcpu_insn_exec,
> +                rfile_name ? QEMU_PLUGIN_CB_R_REGS : QEMU_PLUGIN_CB_NO_R=
EGS,
> +                output);
>=20=20
>              /* reset skip */
>              skip =3D (imatches || amatches);
> @@ -177,17 +201,53 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, stru=
ct qemu_plugin_tb *tb)
>      }
>  }
>=20=20
> +static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
> +{
> +    int reg =3D 0;
> +    bool found =3D false;
> +
> +    expand_cpu(vcpu_index);
> +
> +    if (rfile_name) {
> +        int i;
> +        int j;
> +        int n;
> +
> +        qemu_plugin_register_file_t *rfiles =3D
> +            qemu_plugin_get_register_files(vcpu_index, &n);
> +
> +        for (i =3D 0; i < n; i++) {
> +            if (g_strcmp0(rfiles[i].name, rfile_name) =3D=3D 0) {
> +                for (j =3D 0; j < rfiles[i].num_regs; j++) {
> +                    if (g_strcmp0(rfiles[i].regs[j], reg_name) =3D=3D 0)=
 {
> +                        reg +=3D j;
> +                        found =3D true;
> +                        break;
> +                    }
> +                }
> +                break;
> +            }
> +
> +            reg +=3D rfiles[i].num_regs;
> +        }
> +
> +        g_free(rfiles);
> +    }
> +
> +    g_rw_lock_writer_lock(&expand_array_lock);
> +    cpus[vcpu_index].reg =3D found ? reg : -1;
> +    g_rw_lock_writer_unlock(&expand_array_lock);
> +}
> +
>  /**
>   * On plugin exit, print last instruction in cache
>   */
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
>      guint i;
> -    GString *s;
> -    for (i =3D 0; i < last_exec->len; i++) {
> -        s =3D g_ptr_array_index(last_exec, i);
> -        if (s->str) {
> -            qemu_plugin_outs(s->str);
> +    for (i =3D 0; i < num_cpus; i++) {
> +        if (cpus[i].last_exec->str) {
> +            qemu_plugin_outs(cpus[i].last_exec->str);
>              qemu_plugin_outs("\n");
>          }
>      }
> @@ -224,9 +284,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugi=
n_id_t id,
>       * we don't know the size before emulation.
>       */
>      if (info->system_emulation) {
> -        last_exec =3D g_ptr_array_sized_new(info->system.max_vcpus);
> -    } else {
> -        last_exec =3D g_ptr_array_new();
> +        cpus =3D g_new(CPU, info->system.max_vcpus);
>      }
>=20=20
>      for (int i =3D 0; i < argc; i++) {
> @@ -236,13 +294,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plu=
gin_id_t id,
>              parse_insn_match(tokens[1]);
>          } else if (g_strcmp0(tokens[0], "afilter") =3D=3D 0) {
>              parse_vaddr_match(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "rfile") =3D=3D 0) {
> +            rfile_name =3D g_strdup(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "reg") =3D=3D 0) {
> +            reg_name =3D g_strdup(tokens[1]);
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
>          }
>      }
>=20=20
> +    if ((!rfile_name) !=3D (!reg_name)) {
> +        fputs("file and reg need to be set at the same time\n", stderr);
> +        return -1;
> +    }
> +
>      /* Register translation block and exit callbacks */
> +    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

