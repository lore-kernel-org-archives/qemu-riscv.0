Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBB3C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:41:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qypkR-00064v-Dp; Fri, 03 Nov 2023 04:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypkP-00062l-2o
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:41:45 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypkM-0007uI-BC
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:41:44 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso2881447a12.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699000900; x=1699605700; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=riLFcfPYNOzTfgJPY9RgePEkUL5HjPL0i0qIsZBP5FI=;
 b=M3s0UvumiKDnDf20wzAMtvM5ccf3aC3LqyRJ/LJm4nm6srNBj57yM/apBg1nFOtG7o
 ptPzQx93tiN+qZLu4J9eqKoxYJUyqj6pDtKVPdqAzAFG0iUcUE/j0J9u8+Snbx/U0B3q
 BRini/2zcWik/VRIf/Y2LuD6rO27zxNqVzO6lEVjc5KrOcdsb0k8Rzc/JYN11qjRMs5L
 fuihOO7ikoX49q/llWlMNXlckILzcRwuh9pJ2+mc97PqGyD6kP3xn6ZAwNmhZsiaU1Ke
 ZtEjxHY9wRv+/rKxkGvPDebvoVSWLJe7xQchYbyfNSxvxfVa3ZDKUYtYUtVdcREE5BoC
 cEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699000900; x=1699605700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riLFcfPYNOzTfgJPY9RgePEkUL5HjPL0i0qIsZBP5FI=;
 b=MU2lWHt2zQiL6bstbU2nea1N6FRxYTWTiK954a11hWYx0unJmB/HXoBazTZm+GD+3P
 2l3OUpGRWWpFqrfimWiZYACdFEpWKeD6Kk8HjtprrrZRaz2pn16s4Vdh/qcKDey5Hf2K
 DK3TltAYk/brJ6bsMqRWrOk/TUT3ZQSWxmcDA7C2qa1LSKkBpARm55x95FklMvhtvyQG
 3O/4BtE47KA6UqqV+v+K1YyMKgyV06QzG4YL8hZfr5LjBaDg+aOFBPmNqQ73+GNsI/lM
 F5bWFlTPM7b658CqGMUd0AM2neZSBG3E9BDoy3+fKaypL/c9Yd8rTQxuNB+CXiojJ6jh
 7rtA==
X-Gm-Message-State: AOJu0YxSExBYJCg0VNfNJmwfxpqKuS/mEELNsARJ+Po8rEQjoKGiXxfC
 knq2ASkL+fGuntiL3srajfBqmQ==
X-Google-Smtp-Source: AGHT+IGz0PsyFVKqvhkCvJ44qYkEQVOF7na/g5YDb/eTRIfOcFo6/IAp7IAG8nBQ82Ncvv+HUBypMA==
X-Received: by 2002:aa7:de15:0:b0:53d:eca9:742e with SMTP id
 h21-20020aa7de15000000b0053deca9742emr19169021edv.9.1699000900457; 
 Fri, 03 Nov 2023 01:41:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7d491000000b0053443c8fd90sm695383edr.24.2023.11.03.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 01:41:40 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:41:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v9 10/19] target/riscv/tcg: add user flag for profile
 support
Message-ID: <20231103-d807055c7e1eb53d8f8eb1b7@orel>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
 <20231102224445.527355-11-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102224445.527355-11-dbarboza@ventanamicro.com>
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

On Thu, Nov 02, 2023 at 07:44:36PM -0300, Daniel Henrique Barboza wrote:
...
> +        if (profile->enabled) {
> +            /*
> +             * Note: the 'priv_spec' command line option, if present,
> +             * will take precedence over this priv_ver bump.
> +             */
> +            cpu_validate_multi_ext_priv_ver(&cpu->env, ext_offset);
> +        }

If we moved the comment into cpu_validate_multi_ext_priv_ver() we wouldn't
need it's third occurrence to be added here.

Thanks,
drew

