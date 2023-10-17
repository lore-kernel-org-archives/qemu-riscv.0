Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CEBCDB482
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsf80-0002nU-LN; Tue, 17 Oct 2023 04:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qsf7z-0002n7-3B
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 04:08:35 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qsf7x-0000w0-1K
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 04:08:34 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50435a9f800so6724598e87.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697530110; x=1698134910; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MFoeWXiq0wH1jWwsQvkLye6Sl5eUUJdhFpnOymV4uCg=;
 b=Sm6u8a5gYBhpws3GlBT/JKk+JDSiVWxdAhY5ZfrjkrPJb0oRcE0DrRlyLoHMk4CDaL
 ktd4FBFu2wkPN7GThGB732P8jTDG8yHNg+iPVn4UGUQYli5uKOcRiBhnqcHTU6tjNqey
 sBLU0Axew5NPwDfWyMSmN+3rH8vw/jR+SY/I7LeaCswFniWmRoqq7DJRxIhWQERr6VSS
 DS38BsAhT4/QGYenVLNB4vY364KQ1tA5OT0iogngkjj03iyRCu75qDRetliqc7tbKy1R
 v3nauM8/PSyf7atQXZuE5iDUMHIwY0K7KReY9gSTJhG0yffvY2XIraYTsbCMbi35Ygra
 myug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697530110; x=1698134910;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MFoeWXiq0wH1jWwsQvkLye6Sl5eUUJdhFpnOymV4uCg=;
 b=YBYz4aPrdpYkkXhJ1dd2muQTNTNT7xvvOCROn2FdZ/FhKGZFY/+iUxXCd7UfQg3RWQ
 ZENBM/jsNWCnSBs5o6CWYTJUKkLOLto39mzm+Q2gK2FpUdyMs2AvgjVUao92JVb2Go3i
 UfbbVx3ldFo8FAXU0f4XEmts/OFiXs6N8Q9f+8tPDGu+AgfLQOuEvUsP7aLjNuLvnqQv
 WFq7JMfbDLpXS091ky8dahXWrlkPj4M5mbSh4tTKaufLYtzJxi1zo+dTCYUYLmRZYdJu
 tjSH1RYDYMgsYCvlpRN8k1EpfYMrXxt6vZTctkfXU2hUIEMKMGjrE1QEiSG2JLJFno3d
 CtUg==
X-Gm-Message-State: AOJu0YyPgCWQ9MkVOCxAq8oC5F4oPuhO8RTwxya4rLhZtn2PfcjyAEs6
 Mohz08ziNkwpf3UE2FBRPyX/tA==
X-Google-Smtp-Source: AGHT+IHaISLZ9hixqcuoOm0uvmQIvV1VcGa2nWiaqRUGAsj3fIEcSbppTS9I9VSviQ8zLkC9DklbLA==
X-Received: by 2002:ac2:4c2d:0:b0:4ff:7f7f:22e7 with SMTP id
 u13-20020ac24c2d000000b004ff7f7f22e7mr1278433lfq.17.1697530110474; 
 Tue, 17 Oct 2023 01:08:30 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c3b0e00b004064e3b94afsm9321435wms.4.2023.10.17.01.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 01:08:29 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:08:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
Message-ID: <20231017-e7a4712137165b59844499e3@orel>
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
 <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
 <20231016-cf26d23a1fe53ee3b5b68513@orel>
 <CAKmqyKMg0VKRQ_kFLHJQCq19p-Yv4iJqJZF3XGZWxfuYPe3rbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMg0VKRQ_kFLHJQCq19p-Yv4iJqJZF3XGZWxfuYPe3rbQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x12f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Oct 17, 2023 at 01:55:47PM +1000, Alistair Francis wrote:
> On Mon, Oct 16, 2023 at 7:03 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Oct 12, 2023 at 04:07:50PM -0300, Daniel Henrique Barboza wrote:
> > >
> > >
> > > On 10/11/23 00:01, Alistair Francis wrote:
> > > > On Sat, Oct 7, 2023 at 12:23 AM Daniel Henrique Barboza
> > > > <dbarboza@ventanamicro.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Several design changes were made in this version after the reviews and
> > > > > feedback in the v1 [1]. The high-level summary is:
> > > > >
> > > > > - we'll no longer allow users to set profile flags for vendor CPUs. If
> > > > >    we're to adhere to the current policy of not allowing users to enable
> > > > >    extensions for vendor CPUs, the profile support would become a
> > > > >    glorified way of checking if the vendor CPU happens to support a
> > > > >    specific profile. If a future vendor CPU supports a profile the CPU
> > > > >    can declare it manually in its cpu_init() function, the flag will
> > > > >    still be set, but users can't change it;
> > > > >
> > > > > - disabling a profile will now disable all the mandatory extensions from
> > > > >    the CPU;
> > > >
> > > > What happens if you enable one profile and disable a different one?
> > >
> > > With this implementation as is the profiles will be evaluated by the order they're
> > > declared in riscv_cpu_profiles[]. Which isn't exactly ideal since we're exchanging
> > > a left-to-right ordering in the command line by an arbitrary order that we happened
> > > to set in the code.
> > >
> > > I can make some tweaks to make the profiles sensible to left-to-right order between
> > > them, while keeping regular extension with higher priority. e.g.:
> > >
> > >
> > > -cpu rv64,zicbom=true,profileA=false,profileB=true,zicboz=false
> > > -cpu rv64,profileA=false,zicbom=true,zicboz=false,profileB=true
> > > -cpu rv64,profileA=false,profileB=true,zicbom=true,zicboz=false
> > >
> > > These would all do the same thing: "keeping zicbom=true and zicboz=false, disable profileA
> > > and then enable profile B"
> > >
> > > Switching the profiles order would have a different result:
> > >
> > > -cpu rv64,profileB=true,profileA=false,zicbom=true,zicboz=false
> > >
> > > "keeping zicbom=true and zicboz=false, enable profile B and then disable profile A"
> > >
> > >
> > > I'm happy to hear any other alternative/ideas. We'll either deal with some left-to-right
> > > ordering w.r.t profiles or deal with an internal profile commit ordering. TBH I think
> > > it's sensible to demand left-to-right command line ordering for profiles only.
> >
> > left-to-right ordering is how the rest of QEMU properties work and scripts
> > depend on it. For example, one can do -cpu $MODEL,$DEFAULT_PROPS,$MORE_PROPS
> > where $MORE_PROPS can not only add more props but also override default
> > props (DEFAULT_PROPS='foo=off', MORE_PROPS='foo=on' - foo will be on).
> > left-to-right also works with multiple -cpu parameters, i.e. -cpu
> > $MODEL,$DEFAULT_PROPS -cpu $MODEL,$MY_PROPS will replace default props
> > with my props.
> 
> That seems like the way to go then
> 
> >
> > I don't think profiles should be treated special with regard to this. They
> > should behave the same as any property. If one does
> > profileA=off,profileB=on and there are overlapping extensions then a
> 
> But what does this mean? What intent is the user saying here?
> 
> For example if a user says:
> 
>     RVA22U64=off,RVA24U64=on
> 
> They only want the extensions that were added in RVA24U64? What about
> G and the standard extensions?

Disabling a profile is certainly odd, because I wouldn't expect profiles
to be used with any CPU type other than a base type, i.e. they should be
used to enable extensions on a barebones CPU model, which means setting
them off would be noops.  And, if a profile is set off for a cpu model
where extensions are set either by the model or by previous profile and
extension properties, then it also seems like an odd use, but that's at
least consistent with how other properties would work, so I'm not sure we
need to forbid it.

> 
> To me it just seems really strange to have more than 1 profile.
> Profiles are there to help software and users have common platforms.
> Why would a user want to mix-n-match them

I think it's possible users will want to describe platforms which are
compatible with more than one profile, e.g. RVA22U64=on,RVA24U64=on.

The example I gave Andrea about this was that C may get demoted from
mandatory to optional in later profiles. If a platform is built which
conforms to an older profile with C and to the later profile where C
is only optional, then enabling both profiles will ensure that C is
enabled, whereas only enabling the later profile will not, and then
C must be added manually after inspecting the older profile to see
what will be missed. OIOW, the burden of individual extension management
will still be present if only single profiles may be enabled at a time.
(And, even if the later profile was a strict superset of the older one,
then, if a user wants to explicitly describe a platform which claims
compatibility with both profiles, they probably shouldn't be punished
for it, even if the resulting extension enablement would be equivalent
to only enabling the later profile.)

Thanks,
drew

