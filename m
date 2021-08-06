Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBtCV-0003cK-KN
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 02:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBtCT-0003bS-Ue; Fri, 06 Aug 2021 02:19:21 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBtCS-0003IM-7u; Fri, 06 Aug 2021 02:19:21 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id z128so13261376ybc.10;
 Thu, 05 Aug 2021 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ejm+HJehpA2MmcNsd6+rAYcwfRzXLgp5riq3MM2z7k=;
 b=Hk3U67fYwObytyzL7kMytqIHG9t+yhNtr6Cv+C6o79o4BOyAzS/qzmNwscoU9iRnlq
 8zs/xtbYxgyMKa9yiWTO/LAwCVAnAG4ldY+fn2IPQlzpXs/tO7/Qm67DfiOkhsGi33nt
 anVG4cu+7819Kxw5+1nmgBy+lHkQ53IXCr52VL1Ehyvf+9k9dfDQdup6qnV0y6uPlNpJ
 0y3QtTBdh6b94Qgr1tRR5h08L3ZAk8dEfIZeM+K09JNJkqx5rhymKXP3AxCFh35E49+B
 w4VmoT86W29pumi11UrALhpgGLOkoxR27pOkUDUNvaRzkAqIEbROpCXuwcYdj+TmoAiY
 skqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ejm+HJehpA2MmcNsd6+rAYcwfRzXLgp5riq3MM2z7k=;
 b=uGMPiKoEBpqiSBSBSscuLUP41MKHJw9XyV2/aD8XgTGb1ZXGjzLWQqMWJ1aSnRm+rc
 5untV2o0mmegb4uWdE+aSPLRXahuQC8J4KBJjXwpF8AcivtX0rRUDwB7Mfn1F1jNBPZx
 K6iiovNvKKj0EzH8jtHiW6WYqPumkKlfjOgBFoCXxIvXoOwSv7/y86ly6z+/ZdRDS38v
 7S+6AJHTG2bdY5ZGLhKiIKuMpXMGkvY5JdWbMAMmxK0Sps8nlPU4weH9DFMcrcmH1dkn
 meFRRRvOfXmTjfyTFdcZQdteBg8p9+llkEFy5CIfvmdkypsqK9jDpz5Q/E3+dwGm+7Wz
 AoRw==
X-Gm-Message-State: AOAM530VNyb7UvBkXyKuaCSqy462ZFizqdyKHOWDpGDWN1+bKowR6heg
 NkgwbspkwJROMYVe7kx85O2c/w4NQz4u2DAropU=
X-Google-Smtp-Source: ABdhPJzueFP0VwQFQ9p1hf8mKZIsvblw4VbGpXpiLo7qpGPYsgoUgb4QS7Z9nIxZCU/6jXBi0eDAiU+y2WtQo2u3uYM=
X-Received: by 2002:a5b:304:: with SMTP id j4mr10808235ybp.314.1628230758943; 
 Thu, 05 Aug 2021 23:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-3-ruinland@andestech.com>
 <CAEUhbmWXZBwvsDC5VYvQs+3zssNaRFwKz14fJPnPQHJCpwVUPg@mail.gmail.com>
 <SG2PR03MB4263FC66699A8EEF805DDAF3D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB4263FC66699A8EEF805DDAF3D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 14:19:07 +0800
Message-ID: <CAEUhbmXGJe7HvXAkedcNY7S4wE3fM_wUr3JPx=WD4k0pNM_QQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/4] Adding basic custom/vendor CSR handling
 mechanism
To: =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?RHlsYW4gRGFpLVJvbmcgSmhvbmco6Y2+5bKx6J6NKQ==?= <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 06 Aug 2021 06:19:22 -0000

On Fri, Aug 6, 2021 at 2:08 PM Ruinland Chuan-Tzu Tsa(=E8=94=A1=E5=82=B3=E8=
=B3=87)
<ruinland@andestech.com> wrote:
>
>
> Hi Bin and Alistair,
>
>
> >> +#if defined(CONFIG_RISCV_CUSTOM)
> >> +static void setup_custom_csr(CPURISCVState *env,
> >> +                             riscv_custom_csr_operations csr_map_stru=
ct[]
> >> +                             ) {
>
> >{ should be put to the next line, per QEMU coding convention. Please
> >fix this globally in this series.
>
> Will do
>
> >> +
> >> +    env->custom_csr_map =3D g_hash_table_new_full(g_direct_hash, \
> >> +                                                g_direct_equal, \
> >> +                                                NULL, NULL);
>
> > Is it possible to juse use g_hash_table_new() directly, with both 2
> > parameters being NULL, given you don't provide the destroy hooks?
> > like:
> >
> >    env->custom_csr_map =3D g_hash_table_new(NULL, NULL);
>
> I can try.
>
> >> +
> >> +
> >> +    int i;
>
> >nits: please move this to the beginning of this function.
>
> Will do.
>
> >> +    for (i =3D 0; i < MAX_CUSTOM_CSR_NUM; i++) {
> >> +        if (csr_map_struct[i].csrno !=3D 0) {
> >> +            g_hash_table_insert(env->custom_csr_map,
> >> +                GINT_TO_POINTER(csr_map_struct[i].csrno),
> >> +                &csr_map_struct[i].csr_opset);
> >> +        } else {
> >> +            break;
>
> >break? I think we should continue the loop.
>
> Please refer to Patch 4.
> The table is null-ended.
> Thus it's a break here.
>
>
> >> +typedef struct {
> >> +    int csrno;
> >> +    riscv_csr_operations csr_opset;
> >> +    } riscv_custom_csr_operations;
>
> > } should be put in the beginning without space. Please fix this
> > globally in this series.
>
> Will do.
>
> > +
> > +/*
> > + * The reason why we have an abstraction here is that : We could have =
CSR
> > + * number M on hart A is an alias of CSR number N on hart B. So we mak=
e a
> > + * CSR number to value address map.
> > + */
> > +typedef struct  {
> > +    int csrno;
> > +    target_ulong val;
> > +    } riscv_custom_csr_vals;
> > +
>
> It looks this struct is not used by any patch in this series?
>
> >>  /* CSR function table constants */
> >>  enum {
> >> -    CSR_TABLE_SIZE =3D 0x1000
> >> +    CSR_TABLE_SIZE =3D 0x1000,
> >> +    MAX_CUSTOM_CSR_NUM =3D 100
>
> >To be consistent, name this to be: CUSTOM_CSR_TABLE_SIZE
>
> Sounds reasonable.
>
> >>  /* CSR function table */
> >> +extern int andes_custom_csr_size;
> >> +extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_=
CSR_NUM];
>
> >The above 2 should not be in this patch.
> Could you elaborate a little bit more ?

These 2 should belong to patch 4 where Andes custom CSR is added.

>
> >>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> >>
> >>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
> >>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> >>
> >> +
>
> >This is unnecessary.
> Sorry for the newline.
>
> >> -#if !defined(CONFIG_USER_ONLY)
> >> +#pragma GCC diagnostic push
> >> +#pragma GCC diagnostic ignored "-Wunused-function"
>
> >Use __attribute__((__unused__)), so we don't need to use GCC push/pop
> Thanks for the tips.
> Will do.
>
> >> +/*
> >> + * XXX: This is just a write stub for developing custom CSR handler,
>
> >Remove XXX
> Will do.
>
> >> + * if the behavior of writting such CSR is not presentable in QEMU an=
d doesn't
>
> >typo: writing.
>
> >Is that present, or presentable?
>
> It's not a writing typo. I mean "presentable" with its literal meaning.
> If we cannot demonstrate a hardware feature inside QEMU, we can just stub=
 it.
>
>
> >> +#if defined(CONFIG_RISCV_CUSTOM)
> >> +/* Custom CSR related routines and data structures */
> >> +
> >> +static gpointer is_custom_csr(CPURISCVState *env, int csrno)
>
> >The function name suggests that the return value should be of bool
> >type. Suggest we do:
>
> >static bool is_custom_csr(CPURISCVState *env, int csrno,
> >riscv_custom_csr_operations *custom_csr_ops)
>
> Thanks for the advice, will modify it for V5.
>
>
> >> +
> >> +
>
> >Unnecessary changes
> Sorry for the newline.
>
> >>  int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_valu=
e,
> >>                  target_ulong new_value, target_ulong write_mask)
> >>  {
> >>      int ret;
> >>      target_ulong old_value;
> >>      RISCVCPU *cpu =3D env_archcpu(env);
> >> +    #if !defined(CONFIG_RISCV_CUSTOM)
>
> >Please make sure #if starts from the beginning of this line, without spa=
ce ahead
> Will do.
>
> >> +    riscv_csr_operations *csrop =3D &csr_ops[csrno];
>
> >nits: name this variable to csr_ops
>
> It will collide with original csr_ops.

Maybe csr_op ?

> I'll change to another name.
>
>
> >>
> >> +#if defined(CONFIG_RISCV_CUSTOM)
> >> +/* Include the custom CSR table here. */
>
> >nits: remove the ending .
> Will do.
> Sorry for all these style format issues.
> I must I cherry-picked a wrong before I ran checkpatch.pl.
>
> >> +/* This file is intentionally left blank at this commit. */
>
> >nits: remove the ending .
>
> >%s/at/in
>
> Will do.
>
> >Regards,
> >Bin
>
> Thanks for the quick reply and advice.
> I'll cook the v5 ASAP.

Note: one more place you need to modify in this patch, is the
riscv_gen_dynamic_csr_xml() in target/riscv/gdbstub.c

Regards,
Bin

