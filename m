Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B1EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 08:30:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ8ln-0006n5-B4; Tue, 11 Jul 2023 04:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qJ8lk-0006mt-Gz
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 04:30:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qJ8lT-0001Pc-Si
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 04:30:48 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso55625815e9.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689064229; x=1691656229;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yOlWtKVl0rW4JNCIuxRHSNe9H2DcX1nbHL6z9rExvlU=;
 b=R0jVyltAfDpv3+YG7j/uQDxxywb9mKfqrc4ltkIgoW2ZNIVxkpZ0vvM/gLq8n0LnFP
 //I4dAXfjM7o4kB12gg+D9zXYb7hk4fWL3J74m5Z6COlPnzM/gsw2Zs3AMvHL1Sgs1oL
 jvbayl7wboYaBqRhlyRCddvBHr7/+kyb+9gCsm7PzJKwQjIkxwcC6xB5gF6P22Acxew/
 VhktBD6rIiBN/Vz+3Z1dLUWSWenlefsI49SJ0+6Jm6Ctk5mDabrVye2sBiply8yu03Bu
 Y7IPg+hv21Ce+NsOvRasb17x1PY9JaXzgkM2O8ipXqniMjO9iE13jqrW9K/f1hjOm0g8
 mxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689064229; x=1691656229;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOlWtKVl0rW4JNCIuxRHSNe9H2DcX1nbHL6z9rExvlU=;
 b=krWQsPh7bbg5oQQLhdzlLGJ1AFrmWGsAtqlkrAqG2g/USGy/2qSLRrJbVvYja+txlG
 YKNwahxMjDeyJaVIiup+iD21xSeHHZqcFd4TyzeCVFA+ya+VOYTYfbF3WPUkKzkWlxsE
 pmVCukVZP6UV/vOukuBPku+04vccK8vt8muf589ppTNdZXAmH/1xNVFlX7Exm3t1ZLmE
 PfwXw1WzESeuxf9xMxqSdgVIk2L1uNXFpvIM0LVTljghFszla++IDq4baXShMN9osncS
 IseS6Ozh+JLdD6Q5maQ4ekII2BCUrqTkf9/I1m6Ajx7qRfwqgdaDu44BzL6ghpplCd85
 HeEg==
X-Gm-Message-State: ABy/qLY8MYh804dwQHWVHeP6uadhemx/EBgd0/1Oj9wLqttXrVejI9sP
 dlzArwU0EMf3b20l+F0JybQ5pw==
X-Google-Smtp-Source: APBJJlEQbDWlY6T/VlKxpGy7KqT6OnEB8VSkI8RT6s5IRlUdRKqntqQY/1JzGbWRCOe8Owbc7m1XUQ==
X-Received: by 2002:adf:f60c:0:b0:311:1aee:4e1d with SMTP id
 t12-20020adff60c000000b003111aee4e1dmr13725658wrp.33.1689064229427; 
 Tue, 11 Jul 2023 01:30:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adffe86000000b0031435731dfasm1596876wrr.35.2023.07.11.01.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:30:29 -0700 (PDT)
Date: Tue, 11 Jul 2023 10:30:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>, Andrea Bolognani <abologna@redhat.com>
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Message-ID: <20230711-c2dd60b2d7d86712dc8a1c59@orel>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, Jul 10, 2023 at 02:53:12PM -0300, Daniel Henrique Barboza wrote:
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
> 
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
> 
> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
> of extensions. We would also support enabling optional profile extensions.
> Yes, we don't have all the profile extensions available yet (neither does
> the kernel AFAIK) but nothing is stopping us from adding the base
> framework;
> 
> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
> Yes, a rather arbitrary criteria, but Linux is the most common OS used
> by RISC-V QEMU currently so we'll go with what most people are using.
> This would reduce rv64 to "rv64ima".
> 
> The end result is that we would have a max extensions CPU, a barebones
> generic CPU that can be fully customizable from the ground up, and
> a profile option to allow users to boost the generic CPUs with a
> set of extensions. We will avoid having to deal with generic CPUs having
> an (apparently) arbitrary set of extensions.
> 
> I don't think we'll have too much opposition on adding (1) so I'll get
> on it. I really would like to hear about (2) and (3). (3) will break
> users that are using rv64 while counting with that whole set of extensions
> that are being enabled by default, but this is why we're going to add
> (2) first.

Everything sounds good to me, once we've agreed on a proper "minimal
Linux supporting" base to map rv64 to. One thing I would change, though,
is rather than have an enum property 'profile', I'd create booleans
rva22S64, rva23S64, ... Keeping cpu properties boolean simplifies
introspection. And, when we have mutually exclusive profiles, QEMU can
error out at cpu feature finalize time, but, when they're not mutually
exclusive, then why not allow more than one to be selected.

Thanks,
drew

