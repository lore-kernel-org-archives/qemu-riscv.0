Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ADAC369AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7rnp-0008HC-3u; Thu, 24 Apr 2025 04:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u7rnm-0008DI-Bx
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 04:19:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u7rnk-0001PE-8z
 for qemu-riscv@nongnu.org; Thu, 24 Apr 2025 04:19:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso5927465e9.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Apr 2025 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745482758; x=1746087558; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+1QqK4SKf6guRfgcOnlG5x/BzIBC5P5X5as31OIbj7k=;
 b=BmEtvFqUnhnLub6oVuCQMDo1aTr3Ol5pLn9ow8wyNyf/7OPr57bx2J7nnda/rZRVdb
 LyWsU7nqyscGj3ZkcuqlBT5aroS4ipJYHT6CPDPstHt1IZ2GmvkOPahq98SsduNp69Cf
 FKV2t7GesCsguOBdN6fT8XP6k3lHIJ3Uin8b7c3avcpwJaeMBh3wo4NKJUQSNADT6+37
 1VmC62U4UpOpQBKjvk2kt/ZHqlhk0/rF468mao6eZX34lVSTcjNMT1xnYPf79Em8xOE8
 EvCU06A+2N7RA2z4oOK/MQQl8mXteXGXgBcp3v0DUGOP5puitBHjyXunRLeLiS+/LuPd
 aH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745482758; x=1746087558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1QqK4SKf6guRfgcOnlG5x/BzIBC5P5X5as31OIbj7k=;
 b=Vn6xVD29pPkPzJ/VZ5aYcC4g9NmPFsUqxCY0YkXAlLEbo4kZNxGArIYZDjXiRWJWED
 P+j+el/o5k+IJ9xHv5qhfTdt6MxANrcvCxEw5uZRKWo2jQBTu1IdzLg0HhxFr72Q81pn
 vqa5e0c2TxPi2ugOPExJfsfMb/KBseqCJYiPbQz979uEz1G7yDND2V8KaNqIGQprf4M+
 6nBCdKBTrI1te3pIvpZom/GPJncLiMevfdvGtuMX7QoVZshg/jTv96+JGckqzI6aljY8
 vNyNB0wbtk8cw690hj3DaVDk7sLndiJbGoNGRSBY0nlqmrwzxb80v9pBFo7MPeRG5F6F
 mxdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbbDIO3jubPe1T471EF3vUD1xUexKTWZsVL+JXpp0SLfgabCIZs/k5iy5zYpbs5tX51i/ySVgdB0I+@nongnu.org
X-Gm-Message-State: AOJu0YzOcZ46mFJbnW91c8Awr2o+i/z1WQh78UOcZBe/tKbpbde0nFrG
 jvuCHCo4bmhvmRAQFWxJHLBeB5Yrukpk83FAGSdCe2dcZ2yZwuGIfi9ugnA1cU0=
X-Gm-Gg: ASbGncsI9hrDNGVi52fwfJYebKc99Bkwfa8ML8XG4ocibhBbAl9ZEfDeQNi7QAXlxxC
 HO7RmtYqpAuOor+/7iIegmzU6Vrp5GI5SreIcjWJkvinZLEohhvqoR/2BNWPrkyQFX3MijfyTqJ
 CxmBYvmqbXyMbWTWbf24PgzkFWCCmNhAvImUrdIQc2QCV+oWwphQNkWI/I2y+fjRX5BnoRMrG/P
 kb8CGoulUukIR69gbbB/Gpleo59vnI5nAUBF+yrDfFH2uRcGui+Ui08OLAI9CE9svwSR+A0mpxk
 JBQefLetTvDJNCrpX6YtudrnLhPkpwIGrHjN4LM=
X-Google-Smtp-Source: AGHT+IHqP5o3lBSERpKKsqD4kvcgfqMsNXq70A+b8ZolIDYsjWPWrYH3bZny3+sWUXZbYqPfJDSOZw==
X-Received: by 2002:a05:600c:1d02:b0:43d:738:4a9 with SMTP id
 5b1f17b1804b1-4409bdae980mr14514245e9.27.1745482757653; 
 Thu, 24 Apr 2025 01:19:17 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4bc3c8sm1257348f8f.34.2025.04.24.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:19:17 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:19:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 abologna@redhat.com
Subject: Re: [PATCH 4/7] target/riscv/kvm: add kvm_csr_cfgs[]
Message-ID: <20250424-f2728ec04e66fdbb602fed90@orel>
References: <20250417124839.1870494-1-dbarboza@ventanamicro.com>
 <20250417124839.1870494-5-dbarboza@ventanamicro.com>
 <20250423-9623c5901480c9e7be10d9e5@orel>
 <6f1cfe50-3261-4121-8b5b-6f69456f1257@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1cfe50-3261-4121-8b5b-6f69456f1257@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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

On Wed, Apr 23, 2025 at 04:45:29PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 4/23/25 12:15 PM, Andrew Jones wrote:
...
> >   if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint32_t)) {
> >       kvm_cpu_csr_set_u32(cpu, csr_cfg, reg);
> >   } else if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint64_t)) {
> >       kvm_cpu_csr_set_u64(cpu, csr_cfg, reg);
> >   } else {
> >       uh, oh...
> >   }
> 
> The idea with this logic is to handle the cases where there is a mismatch
> between the size of the KVM reg and the size of the flag we're using to
> store it. All CSR regs are of size target_ulong but not all CPURISCVState
> flags we're using are target_ulong. We're not storing the size of the KVM
> CSR, we're storing the flag size.
> 
> E.g:
> 
> KVM_CSR_CFG("sstatus", mstatus, sizeof(uint64_t), RISCV_CSR_REG(sstatus)),
> 
> For a 32 bit CPU we're writing a 32 bit ulong sstatus into the 64 bit mstatus
> field. If we assume that they're the same size we'll be read/writing a 32 bit val
> inside a 64 bit field, i.e. we'll be reading/writing the upper words only.

Hmm. I don't think this should be a problem since we're writing the field
offset, which is the low word. A problem may be that we don't clear the
upper word with the write, but it should have been initialized to zero and
never touched.

> 
> In theory this would be ok if we always read/write the same way but it can be
> a nuisance when trying to debug the value inside CPURISCVState.
> 
> One may argue whether we should change the type of these fields to match what
> Linux/ISA expect of them. Not sure how much work that is.

It shouldn't be a problem to use wider fields, we just need to ensure our
framework will be able to write the upper words when necessary, i.e. when
there's an *H counterpart CSR that needs to be written there or when the
upper word should be zeroed out.

> 
> 
> scounteren is a more serious case because we're writing an ulong KVM reg into
> a 32 bit field:

Sigh... it is a problem to use narrower fields... KVM should have defined
that as a __u32.

> 
>     KVM_CSR_CFG("scounteren", scounteren, sizeof(uint32_t),
>                 RISCV_CSR_REG(scounteren)),
> 
> struct CPUArchState {
>     target_ulong gpr[32];
>     (...)
>     uint32_t scounteren;
>     uint32_t mcounteren;
>     (...)
> 
> 
> Perhaps it's a good idea to change this CPURISCVState field to ulong before
> adding support for the scouteren KVM CSR.

Yes, I think we have to now. QEMU's fields need to have widths >= what
KVM says the register sizes are and we should write the amount of bytes
that KVM says we should write (even if we know it's wrong, like in the
case of scounteren). We'll just have to ignore the upper word that
shouldn't be there.

Thanks,
drew

