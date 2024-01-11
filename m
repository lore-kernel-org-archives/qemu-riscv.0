Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97145C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 12:35:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNuGt-0005Pp-JM; Thu, 11 Jan 2024 07:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rNuGe-0005Ix-9T
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:34:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rNuGa-0006JQ-3K
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 07:34:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e5451c13aso24003915e9.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704976472; x=1705581272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Laj5dgyw/ZFfRFO13kyKlguGgpT3a+jIHEPtaFCGeuY=;
 b=CIKqtRhYUxf0ar8m2qkZooMjiLl3pcsBtA80qZzzc/rq6KSJm66mzlBEIexjIKglow
 Sx3fjF2KOcS3HcCN0vtIHXe5G4/BLK/tQLdl8SYtZ+q4AsAA5mRzm9XmMunzXK+ZZWm2
 SteeefFzcjqXDbLaA7OgFDp4oRmQJFYg/lT4Ss86g6Kq422zWVgAgVm14JbvBdUgq16T
 W3NzTeIuP6Ai3Z3iD1u6jlxy198rrZh32tMHSlPP4ZqveBiILlN6GKbB4RiAFT5Xp7w7
 +my/f9Ocn19u6/gJHBJTpUTNylVEg1D2x5pF0zK/+DbZ6NvFaGu1RaOog7G0mP6sODqh
 DSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704976472; x=1705581272;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Laj5dgyw/ZFfRFO13kyKlguGgpT3a+jIHEPtaFCGeuY=;
 b=cKWOYBrtndc5GakP/Nqf22UeppTLqWjxV3dwu5HQ2S7ffXvHiEeiHCqntFRMPi4qtY
 P1/KU7PTAEeAQFEbgZQ2zlgZsg6F9Sj8CxQM+NGaoTeARepUEqGA+VsrO62OSUNcha7T
 bwb5hbDeLlJdfqufRrLpsEw2FAdNfjezzNrlODXyGOmAcpmYO9/P4iFjrl5WYIzr9s+M
 DNdedKG2Fxea4DiWYIl08+ieGPwK2s13u9u2RjdReatHafLiJkBAoxmovsKdlWYZZEAt
 lZFATcfCA6ztI+2LsxEIAJnccw87KbUL8K4U6dKfH9RMUF6LtoghMuoAQCoH5ZKeg+RD
 h/Yg==
X-Gm-Message-State: AOJu0Yyx9shBlyXkycWrczda+Kf/rt7M6FCyF4/pIsTWW/VWYlYObx6t
 zTKW0QOY7uDsxX9/VXoIkfq+yXhMxLtFhA==
X-Google-Smtp-Source: AGHT+IHCqvU083WGqGcVqRzQLj+PUoocXsxh/YK9sBx/8GpEXqP1xY2y/M7R8Oui7TCF0nRIj3X61w==
X-Received: by 2002:a7b:c8c8:0:b0:40e:540a:aefb with SMTP id
 f8-20020a7bc8c8000000b0040e540aaefbmr274151wml.26.1704976472020; 
 Thu, 11 Jan 2024 04:34:32 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b00336b8461a5esm1126877wrn.88.2024.01.11.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 04:34:31 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4752F5F7AD;
 Thu, 11 Jan 2024 12:34:31 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,  Song Gao
 <gaosong@loongson.cn>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>,  Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>,  Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,  David Woodhouse
 <dwmw2@infradead.org>,  Laurent Vivier <laurent@vivier.eu>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Brian Cain <bcain@quicinc.com>,  Daniel Henrique
 Barboza <danielhb413@gmail.com>,  Beraldo Leal <bleal@redhat.com>,  Paul
 Durrant <paul@xen.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Thomas
 Huth <thuth@redhat.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>,  kvm@vger.kernel.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  qemu-arm@nongnu.org,  Weiwei Li
 <liwei1518@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Nicholas Piggin <npiggin@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich <iii@linux.ibm.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org,  Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
In-Reply-To: <6c22ed26-7906-47a2-ab66-57d545ef59f5@linaro.org> (Pierrick
 Bouvier's message of "Tue, 9 Jan 2024 19:05:12 +0400")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-39-alex.bennee@linaro.org>
 <6c22ed26-7906-47a2-ab66-57d545ef59f5@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 11 Jan 2024 12:34:31 +0000
Message-ID: <87il40f3qg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 1/3/24 21:33, Alex Benn=C3=A9e wrote:
>> We can only request a list of registers once the vCPU has been
>> initialised so the user needs to use either call the get function on
>> vCPU initialisation or during the translation phase.
>> We don't expose the reg number to the plugin instead hiding it
>> behind
>> an opaque handle. This allows for a bit of future proofing should the
>> internals need to be changed while also being hashed against the
>> CPUClass so we can handle different register sets per-vCPU in
>> hetrogenous situations.
>> Having an internal state within the plugins also allows us to expand
>> the interface in future (for example providing callbacks on register
>> change if the translator can track changes).
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1706
>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Based-on: <20231025093128.33116-18-akihiko.odaki@daynix.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v3
>>    - also g_intern_string the register name
>>    - make get_registers documentation a bit less verbose
>> v2
>>    - use new get whole list api, and expose upwards
>> vAJB:
>> The main difference to Akikio's version is hiding the gdb register
>> detail from the plugin for the reasons described above.
>> ---
>>   include/qemu/qemu-plugin.h   |  51 +++++++++++++++++-
>>   plugins/api.c                | 102 +++++++++++++++++++++++++++++++++++
>>   plugins/qemu-plugins.symbols |   2 +
>>   3 files changed, 153 insertions(+), 2 deletions(-)
>> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
>> index 4daab6efd29..95380895f81 100644
>> --- a/include/qemu/qemu-plugin.h
>> +++ b/include/qemu/qemu-plugin.h
>> @@ -11,6 +11,7 @@
>>   #ifndef QEMU_QEMU_PLUGIN_H
>>   #define QEMU_QEMU_PLUGIN_H
>>   +#include <glib.h>
>>   #include <inttypes.h>
>>   #include <stdbool.h>
>>   #include <stddef.h>
>> @@ -227,8 +228,8 @@ struct qemu_plugin_insn;
>>    * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
>>    * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
>>    *
>> - * Note: currently unused, plugins cannot read or change system
>> - * register state.
>> + * Note: currently QEMU_PLUGIN_CB_RW_REGS is unused, plugins cannot cha=
nge
>> + * system register state.
>>    */
>>   enum qemu_plugin_cb_flags {
>>       QEMU_PLUGIN_CB_NO_REGS,
>> @@ -708,4 +709,50 @@ uint64_t qemu_plugin_end_code(void);
>>   QEMU_PLUGIN_API
>>   uint64_t qemu_plugin_entry_code(void);
>>   +/** struct qemu_plugin_register - Opaque handle for register
>> access */
>> +struct qemu_plugin_register;
>> +
>> +/**
>> + * typedef qemu_plugin_reg_descriptor - register descriptions
>> + *
>> + * @handle: opaque handle for retrieving value with qemu_plugin_read_re=
gister
>> + * @name: register name
>> + * @feature: optional feature descriptor, can be NULL
>> + */
>> +typedef struct {
>> +    struct qemu_plugin_register *handle;
>> +    const char *name;
>> +    const char *feature;
>> +} qemu_plugin_reg_descriptor;
>> +
>> +/**
>> + * qemu_plugin_get_registers() - return register list for vCPU
>> + * @vcpu_index: vcpu to query
>> + *
>> + * Returns a GArray of qemu_plugin_reg_descriptor or NULL. Caller
>> + * frees the array (but not the const strings).
>> + *
>> + * Should be used from a qemu_plugin_register_vcpu_init_cb() callback
>> + * after the vCPU is initialised.
>> + */
>> +GArray * qemu_plugin_get_registers(unsigned int vcpu_index);
>> +
>> +/**
>> + * qemu_plugin_read_register() - read register
>> + *
>> + * @vcpu: vcpu index
>> + * @handle: a @qemu_plugin_reg_handle handle
>> + * @buf: A GByteArray for the data owned by the plugin
>> + *
>> + * This function is only available in a context that register read acce=
ss is
>> + * explicitly requested.
>> + *
>> + * Returns the size of the read register. The content of @buf is in tar=
get byte
>> + * order. On failure returns -1
>> + */
>> +int qemu_plugin_read_register(unsigned int vcpu,
>> +                              struct qemu_plugin_register *handle,
>> +                              GByteArray *buf);
>> +
>> +
>>   #endif /* QEMU_QEMU_PLUGIN_H */
>> diff --git a/plugins/api.c b/plugins/api.c
>> index ac39cdea0b3..f8905325c43 100644
>> --- a/plugins/api.c
>> +++ b/plugins/api.c
>> @@ -8,6 +8,7 @@
>>    *
>>    *  qemu_plugin_tb
>>    *  qemu_plugin_insn
>> + *  qemu_plugin_register
>>    *
>>    * Which can then be passed back into the API to do additional things.
>>    * As such all the public functions in here are exported in
>> @@ -35,10 +36,12 @@
>>    */
>>     #include "qemu/osdep.h"
>> +#include "qemu/main-loop.h"
>>   #include "qemu/plugin.h"
>>   #include "qemu/log.h"
>>   #include "tcg/tcg.h"
>>   #include "exec/exec-all.h"
>> +#include "exec/gdbstub.h"
>>   #include "exec/ram_addr.h"
>>   #include "disas/disas.h"
>>   #include "plugin.h"
>> @@ -435,3 +438,102 @@ uint64_t qemu_plugin_entry_code(void)
>>   #endif
>>       return entry;
>>   }
>> +
>> +/*
>> + * Register handles
>> + *
>> + * The plugin infrastructure keeps hold of these internal data
>> + * structures which are presented to plugins as opaque handles. They
>> + * are global to the system and therefor additions to the hash table
>> + * must be protected by the @reg_handle_lock.
>> + *
>> + * In order to future proof for up-coming heterogeneous work we want
>> + * different entries for each CPU type while sharing them in the
>> + * common case of multiple cores of the same type.
>> + */
>> +
>> +static QemuMutex reg_handle_lock;
>> +
>> +struct qemu_plugin_register {
>> +    const char *name;
>> +    int gdb_reg_num;
>> +};
>> +
>> +static GHashTable *reg_handles; /* hash table of PluginReg */
>> +
>> +/* Generate a stable key - would xxhash be overkill? */
>> +static gpointer cpu_plus_reg_to_key(CPUState *cs, int gdb_regnum)
>> +{
>> +    uintptr_t key =3D (uintptr_t) cs->cc;
>> +    key ^=3D gdb_regnum;
>> +    return GUINT_TO_POINTER(key);
>> +}
>> +
>> +/*
>> + * Create register handles.
>> + *
>> + * We need to create a handle for each register so the plugin
>> + * infrastructure can call gdbstub to read a register. We also
>> + * construct a result array with those handles and some ancillary data
>> + * the plugin might find useful.
>> + */
>> +
>> +static GArray * create_register_handles(CPUState *cs, GArray *gdbstub_r=
egs) {
>> +    GArray *find_data =3D g_array_new(true, true, sizeof(qemu_plugin_re=
g_descriptor));
>> +
>> +    WITH_QEMU_LOCK_GUARD(&reg_handle_lock) {
>> +
>> +        if (!reg_handles) {
>> +            reg_handles =3D g_hash_table_new(g_direct_hash, g_direct_eq=
ual);
>> +        }
>> +
>> +        for (int i=3D0; i < gdbstub_regs->len; i++) {
>> +            GDBRegDesc *grd =3D &g_array_index(gdbstub_regs, GDBRegDesc=
, i);
>> +            gpointer key =3D cpu_plus_reg_to_key(cs, grd->gdb_reg);
>> +            struct qemu_plugin_register *val =3D g_hash_table_lookup(re=
g_handles, key);
>> +
>> +            /* Doesn't exist, create one */
>> +            if (!val) {
>> +                val =3D g_new0(struct qemu_plugin_register, 1);
>> +                val->gdb_reg_num =3D grd->gdb_reg;
>> +                val->name =3D g_intern_string(grd->name);
>> +
>> +                g_hash_table_insert(reg_handles, key, val);
>> +            }
>> +
>> +            /* Create a record for the plugin */
>> +            qemu_plugin_reg_descriptor desc =3D {
>> +                .handle =3D val,
>> +                .name =3D val->name,
>> +                .feature =3D g_intern_string(grd->feature_name)
>> +            };
>> +            g_array_append_val(find_data, desc);
>> +        }
>> +    }
>> +
>> +    return find_data;
>> +}
>> +
>> +GArray * qemu_plugin_get_registers(unsigned int vcpu)
>> +{
>> +    CPUState *cs =3D qemu_get_cpu(vcpu);
>> +    if (cs) {
>> +        g_autoptr(GArray) regs =3D gdb_get_register_list(cs);
>> +        return regs->len ? create_register_handles(cs, regs) : NULL;
>> +    } else {
>> +        return NULL;
>> +    }
>> +}
>
> Would that be useful to cache the returned value on plugin runtime
> side (per vcpu)? This way, a plugin could call
> qemu_plugin_get_registers as many time as it wants without having to
> pay for the creation of the array.

I suspect plugins would still want to work out what it needed ahead of
time and the cpu list should be static from vcpu_init onwards.

> In more, could we return a hashtable (indexed by regname string)
> instead of an array?

Hmm maybe. Arrays do benefit from being easy to cleanup and we would
still need an internal hash table to track stuff we don't want to expose
to the plugin.

We can always change it later if there is a compelling use case.

> With both changes, a plugin could simply perform a lookup in table
> returned by qemu_plugin_get_registers without having to keep anything
> on its side.
>
>> +
>> +int qemu_plugin_read_register(unsigned int vcpu, struct qemu_plugin_reg=
ister *reg, GByteArray *buf)
>> +{
>> +    CPUState *cs =3D qemu_get_cpu(vcpu);
>> +    /* assert with debugging on? */
>> +    return gdb_read_register(cs, buf, reg->gdb_reg_num);
>> +}
>> +
>> +static void __attribute__((__constructor__)) qemu_api_init(void)
>> +{
>> +    qemu_mutex_init(&reg_handle_lock);
>> +
>> +}
>> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
>> index 71f6c90549d..6963585c1ea 100644
>> --- a/plugins/qemu-plugins.symbols
>> +++ b/plugins/qemu-plugins.symbols
>> @@ -3,6 +3,7 @@
>>     qemu_plugin_end_code;
>>     qemu_plugin_entry_code;
>>     qemu_plugin_get_hwaddr;
>> +  qemu_plugin_get_registers;
>>     qemu_plugin_hwaddr_device_name;
>>     qemu_plugin_hwaddr_is_io;
>>     qemu_plugin_hwaddr_phys_addr;
>> @@ -20,6 +21,7 @@
>>     qemu_plugin_n_vcpus;
>>     qemu_plugin_outs;
>>     qemu_plugin_path_to_binary;
>> +  qemu_plugin_read_register;
>>     qemu_plugin_register_atexit_cb;
>>     qemu_plugin_register_flush_cb;
>>     qemu_plugin_register_vcpu_exit_cb;

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

