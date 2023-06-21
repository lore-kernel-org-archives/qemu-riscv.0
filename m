Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 08:21:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBt54-0000OX-Vy; Wed, 21 Jun 2023 04:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBt51-0000Ng-SE
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 04:20:44 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBt4z-0007Dz-Rf
 for qemu-riscv@nongnu.org; Wed, 21 Jun 2023 04:20:43 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51a3e6a952aso6776313a12.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Jun 2023 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687335639; x=1689927639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kvLjwMq3PxVEGtDnA1BKBzvFsCEnzQ9gEE/LtKASkjM=;
 b=T1UPGKEThgKjWE8s7HD8PWGpuaSsBL1GuDYJT9XfKuHrxxuA8t6cxv06U/ogZKskXe
 J7QekbsFL3A4UhWfE2tEU1rUCnpzyjxuHsM1Byjm2Yb4hAf4vPofrDaPsen/oLi1lTe3
 bujWUkweeN6XVe1QMeOpEjroFihuk2e3hd1KLcH1KpvjBQMs+BpZ50FbFZGBJu/QTZue
 RPsgnF8fA2+oq5GcHXSaDS76RpYNFsmHM+UZCjnV69+DJ+kWDQ2uuVSEMbx/ulYxTL2/
 otIOp5mMP0Y+xoS8ocIMmFIArwu9QaNYHin9/BXdqFj58i4+ReszPhm70TqIyHnvbaCx
 Btgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687335639; x=1689927639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvLjwMq3PxVEGtDnA1BKBzvFsCEnzQ9gEE/LtKASkjM=;
 b=jZHOKn5NQWDzw78+jI3Pj2BzNbUmenxLpaGYhvdOXpn1eOJGOywBhk2sVBKxrGUkB6
 qABsJ4RmhjirLGaDooJuShmmR1TiexmgsLOStTaMJiznqi3qtPswxKxjxvmQNKkpTABA
 ljydCHnndPeYfwASX+e3nhA6i+U2fYcJxpBKEj7d8NdYl09ituHqJC3RJGn/niZDAf4B
 ErknYhrLw0cbcU6oBIGhqcH1xQ9I9AZZuhhvL/HYlkvxfTnASDzss+k8Hvn43PEYcMQ6
 hiXhbdtS13Z40R+o2l5YhKjYFEkhSZpGRfX8+U5X8dCxZ3VhPnMUXg7J2ddTk2a97kqK
 AUrw==
X-Gm-Message-State: AC+VfDxSqAqSReEih+fCKDCFA1VtlAMSVNtZJT9QDdvL0V1ekwVMo8NP
 SdlvdxPzxFs8e3evQDTd5JBbHKPhn05m6e+F0Go=
X-Google-Smtp-Source: ACHHUZ7HNN4dV2M/bPrPMhupBk6d8gxkHcQgDSFHxB26r5ykHbjUkeJsGtR3XmRGAp2pWuyMmg7F1g==
X-Received: by 2002:aa7:c698:0:b0:51a:5966:693a with SMTP id
 n24-20020aa7c698000000b0051a5966693amr5562177edq.13.1687335639093; 
 Wed, 21 Jun 2023 01:20:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 w20-20020aa7d294000000b005182edf2a52sm2275940edq.30.2023.06.21.01.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 01:20:38 -0700 (PDT)
Date: Wed, 21 Jun 2023 10:20:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 15/18] target/riscv: make riscv_isa_string_ext() KVM
 compatible
Message-ID: <20230621-6ff3576dad2e55bb261819c8@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-16-dbarboza@ventanamicro.com>
 <20230619-30e78979c13df598ca2e4493@orel>
 <7c5920b1-8240-9922-c4eb-3d7be7436176@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5920b1-8240-9922-c4eb-3d7be7436176@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
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

On Tue, Jun 20, 2023 at 07:05:18PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 6/19/23 06:54, Andrew Jones wrote:
> > On Tue, Jun 13, 2023 at 05:58:54PM -0300, Daniel Henrique Barboza wrote:
> > > The isa_edata_arr[] is used by riscv_isa_string_ext() to create the
> > > riscv,isa DT attribute. isa_edata_arr[] is kept in sync with the TCG
> > > property vector riscv_cpu_extensions[], i.e. all TCG properties from
> > > this vector that has a riscv,isa representation are included in
> > > isa_edata_arr[].
> > > 
> > > KVM doesn't implement all TCG properties, but allow them to be created
> > > anyway to not force an API change between TCG and KVM guests. Some of
> > > these TCG-only extensions are defaulted to 'true', and users are also
> > > allowed to enable them. KVM doesn't care, but riscv_isa_string_ext()
> > > does. The result is that these TCG-only enabled extensions will appear
> > > in the riscv,isa DT string under KVM.
> > > 
> > > To avoid code repetition and re-use riscv_isa_string_ext() for KVM
> > > guests we'll make a couple of tweaks:
> > > 
> > > - set env->priv_ver to 'LATEST' for the KVM 'host' CPU. This is needed
> > >    because riscv_isa_string_ext() makes a priv check for each extension
> > >    before including them in the ISA string. KVM doesn't care about
> > >    env->priv_ver, since it's part of the TCG-only CPU validation, so this
> > >    change is benign for KVM;
> > > 
> > > - add a new 'kvm_available' flag in isa_ext_data struct. This flag is
> > >    set via a new ISA_EXT_DATA_ENTRY_KVM macro to report that, for a given
> > >    extension, KVM also supports it. riscv_isa_string_ext() then can check
> > >    if a given extension is known by KVM and skip it if it's not.
> > > 
> > > This will allow us to re-use riscv_isa_string_ext() for KVM guests.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/cpu.c | 28 ++++++++++++++++++++--------
> > >   1 file changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index a4f3ed0c17..a773c09645 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -44,11 +44,15 @@ struct isa_ext_data {
> > >       const char *name;
> > >       int min_version;
> > >       int ext_enable_offset;
> > > +    bool kvm_available;
> > >   };
> > >   #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> > >       {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
> > > +#define ISA_EXT_DATA_ENTRY_KVM(_name, _min_ver, _prop) \
> > > +    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop), true}
> > > +
> > >   /*
> > >    * Here are the ordering rules of extension naming defined by RISC-V
> > >    * specification :
> > > @@ -68,14 +72,17 @@ struct isa_ext_data {
> > >    *
> > >    * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
> > >    * instead.
> > > + *
> > > + * ISA_EXT_DATA_ENTRY_KVM() is used to indicate that the extension is
> > > + * also known by the KVM driver. If unsure, use ISA_EXT_DATA_ENTRY().
> > >    */
> > >   static const struct isa_ext_data isa_edata_arr[] = {
> > > -    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
> > > -    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
> > > +    ISA_EXT_DATA_ENTRY_KVM(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
> > > +    ISA_EXT_DATA_ENTRY_KVM(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
> > >       ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> > >       ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
> > >       ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> > > -    ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
> > > +    ISA_EXT_DATA_ENTRY_KVM(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
> > >       ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
> > >       ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
> > >       ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_1_11_0, ext_zfhmin),
> > > @@ -89,7 +96,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
> > >       ISA_EXT_DATA_ENTRY(zcmp, PRIV_VERSION_1_12_0, ext_zcmp),
> > >       ISA_EXT_DATA_ENTRY(zcmt, PRIV_VERSION_1_12_0, ext_zcmt),
> > >       ISA_EXT_DATA_ENTRY(zba, PRIV_VERSION_1_12_0, ext_zba),
> > > -    ISA_EXT_DATA_ENTRY(zbb, PRIV_VERSION_1_12_0, ext_zbb),
> > > +    ISA_EXT_DATA_ENTRY_KVM(zbb, PRIV_VERSION_1_12_0, ext_zbb),
> > >       ISA_EXT_DATA_ENTRY(zbc, PRIV_VERSION_1_12_0, ext_zbc),
> > >       ISA_EXT_DATA_ENTRY(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
> > >       ISA_EXT_DATA_ENTRY(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
> > > @@ -114,13 +121,13 @@ static const struct isa_ext_data isa_edata_arr[] = {
> > >       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> > >       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> > >       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
> > > -    ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> > > +    ISA_EXT_DATA_ENTRY_KVM(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> > >       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> > > -    ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> > > +    ISA_EXT_DATA_ENTRY_KVM(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> > >       ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
> > > -    ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> > > +    ISA_EXT_DATA_ENTRY_KVM(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> > >       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> > > -    ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > > +    ISA_EXT_DATA_ENTRY_KVM(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > 
> > This approach looks a bit difficult to maintain (it's hard to even see the
> > _KVM macro uses). The approach will be even more difficult if we add more
> > accelerators. I feel like we need an extension class where objects of that
> > class can be passed to functions like riscv_isa_string_ext(). And then we
> > also need tcg-extension and kvm-extension classes which inherit from
> > the extension class. We can then keep the lists of extensions separate, as
> > you originally proposed, as each list will be of its own type.
> 
> So, after coding around a little, I didn't manage to create a KVM list in
> kvm.c file because of how ARRAY_SIZE() (a macro that riscv_isa_string_ext())
> calculates the array size. If the list is exported from another file the macro
> fails to calculate the size of the array. Similar issues also happens when trying
> to use kvm_multi_ext_cfgs[] in this function.
> 
> This means that both tcg and kvm arrays ended up in cpu.c.

Hmm, I'd really rather we don't have a kvm array in cpu.c. Going back to
duplicating functions like riscv_isa_string_ext() into kvm.c is better,
IMO.

> The tcg array is
> left untouched (isa_edata_arr). The KVM array uses the same type TCG already
> uses (isa_ext_edata) because it's good enough for KVM as well. I removed the
> 'kvm_available' flag since we're going to manually edit the array.
> 
> riscv_isa_string_ext() is then changed to switch between the tcg/kvm array
> as required. The rest of the logic of the function stood the same. I'll also
> add a pre-patch prior to all these changes to simplify riscv_isa_string_ext()
> a bit when running under TCG.

If we have to teach riscv_isa_string_ext() about both tcg and kvm cfg
types (and any other functions that come along), then this approach
isn't all that helpful anyway.

Thanks,
drew

