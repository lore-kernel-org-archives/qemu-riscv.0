Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D416EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:13:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIvOH-0005Bl-Hj; Mon, 10 Jul 2023 14:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qIvNv-00058m-Ep
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 14:13:22 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qIvNs-000714-DV
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 14:13:19 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-553b2979fceso1646211a12.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689012792; x=1691604792; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=91jz2gEaU2Jf8ij1/gnrV9Hq9qqyZ64UDoh2AydwolQ=;
 b=Js1RF/ctAeBUWm1H8sOvwvCRdfT+4W0bIw2gLPD5fZHn/2KtwKgt39Nzrg4QLqVaUm
 LrFk37gmJKdNKOCssVo44aZFaohjtgnDghWqgQaU5OcPtEUoKZx2knGvohvZ5egP3deS
 7jpEgaYiYY++kG0HAUilLL7zMQYjpRB66/lYiTBNB5f6h1gjzPliYuP/zhlrKYylx74z
 Bs6DbcIlOt0WenUyOpw6u+QJ6z8r996xJE8I0ESUZaE5mjl1znwxVxOFrRS9hslKe5um
 C6TiLn2qJcJAQqtwhEx4a5BZ1u7j7OvJ4Jvzh847SQansIS7dC5nWqYp57X/ri+k/OK5
 P4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689012792; x=1691604792;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91jz2gEaU2Jf8ij1/gnrV9Hq9qqyZ64UDoh2AydwolQ=;
 b=Ps9JJZkGgA3UpBa83/xpHS/Op+dGEaIMAnsHdt9z1D+oAF7GINBXbFIFmaw4HYOad3
 27/fNeDGX1p4d6ifj2l96OKYnCNcXvC2YUQy/24ol40KUFiIYeEzc+/IergLmY1JJvYb
 UOBCYF5BID77dRuZwvm57Yh7sGs1qufUfFzQTL4sa8LLf/LKqQ2JoOB7bN7sMElevrNC
 iFQMrphoLvYHBlyt5KGppDSpnCCtE5xo54+nQKa5O0aGSTnsgAnTDpAePHwwcmNB3900
 4pVgJHrTjcw+gWnexJDt6KEDf4c3xmAY7e0iOx2swapAzRQqvdGvjx0ZCEynxM63RG3W
 dkaQ==
X-Gm-Message-State: ABy/qLZiO/ctJiM209Z4drkCu8vZPJ/jWzLN/fjX2OFKk2bNdm+KJtQx
 vFFPCxDq1xeOX9YWaOa92X0rIVMe/K1YCeKgkmc=
X-Google-Smtp-Source: APBJJlHXy6SlTpiYdOpowPgfgtDR7kT21uzMMm1ESM/mgxXa7B1gJZZ7zpvHIKAy9kzikmwIU2dbJw==
X-Received: by 2002:a05:6a20:385:b0:127:3fea:500a with SMTP id
 5-20020a056a20038500b001273fea500amr10328310pzt.27.1689012791908; 
 Mon, 10 Jul 2023 11:13:11 -0700 (PDT)
Received: from localhost ([50.38.6.230]) by smtp.gmail.com with ESMTPSA id
 jw20-20020a170903279400b001aaecc0b6ffsm198895plb.160.2023.07.10.11.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 11:13:11 -0700 (PDT)
Date: Mon, 10 Jul 2023 11:13:11 -0700 (PDT)
X-Google-Original-Date: Mon, 10 Jul 2023 11:12:25 PDT (-0700)
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
In-Reply-To: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
CC: qemu-riscv@nongnu.org, abologna@redhat.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-dd30114d-b418-4519-944d-be0f0e7f4ae3@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 10 Jul 2023 10:53:12 PDT (-0700), dbarboza@ventanamicro.com wrote:
> Hi,
>
> We don't have a 'max' cpu type in riscv32 and riscv64. This is a special,
> fictional CPU type that has all possible extensions enabled. It can be
> either an alias for a real CPU or a new CPU type. It's used by tooling
> such as libvirt for capabilities probing.
>
> Well, in our case it can't be an alias because we don't have any CPU type
> that enables all extensions. Which brings me to my first question:
> what's the criteria for marking a certain extension default true/false
> in rv32/rv64/rv128?

Pretty sure it's just been a somewhat arbitrary decision, with stuff 
that's likely to be used being enabled when it's added.

> E.g. this is the riscv,isa DT for rv64:
>
> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
>
> It has a lot of extensions but it's missing some common ones like svinval
> and smstateen.
>
> We can add/remove some extensions from these generic CPUs, document it
> and be done with it. I want to propose a different design though:
>
> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
> the extensions are being declared/stored in the code. I'll work on
> it;

IMO it's the right idea in spirit, but there's a handful of conflicting 
extensions -- mostly vendor stuff, but even some of the standard ones 
have conflicting encodings.  So I think there's likely to be some 
decisions to make there, but when there's conflicts there's usually also 
one called out as being aimed at microcontroller-class systems so there 
should be a natural choice.

> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
> of extensions. We would also support enabling optional profile extensions.
> Yes, we don't have all the profile extensions available yet (neither does
> the kernel AFAIK) but nothing is stopping us from adding the base
> framework;

Would we also make incompatible extensions forbidden in the profile 
CPUs?

If we add the 23 profiles, we should probably also add some other bases.  
We've got a defacto base in Linux that's rv{32,64}ima (plus some cruft 
as things have drifted around), I think there's also some interest in 
the 22 profiles.

> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
> Yes, a rather arbitrary criteria, but Linux is the most common OS used
> by RISC-V QEMU currently so we'll go with what most people are using.
> This would reduce rv64 to "rv64ima".

Have a "minimum CPU required to boot Linux" option seems reasonable.  
Most users will probably want at least FD and C, though, so maybe we 
want something like that as well?

> The end result is that we would have a max extensions CPU, a barebones
> generic CPU that can be fully customizable from the ground up, and
> a profile option to allow users to boost the generic CPUs with a
> set of extensions. We will avoid having to deal with generic CPUs having
> an (apparently) arbitrary set of extensions.

IMO we still want to keep the ability to turn on/off extensions, the 
profiles are a long way from being concrete and we'll still have a lot 
of systems floating around that don't line up with them.  Being able to 
test those configurations in QEMU is a huge benefit for users, even if 
it's a headache to keep around all the options.

> I don't think we'll have too much opposition on adding (1) so I'll get
> on it. I really would like to hear about (2) and (3). (3) will break
> users that are using rv64 while counting with that whole set of extensions
> that are being enabled by default, but this is why we're going to add
> (2) first.
>
>
> Please comment. Andrea, feel free to give us libvirt/tooling insights.
>
>
> Thanks,
>
> Daniel

