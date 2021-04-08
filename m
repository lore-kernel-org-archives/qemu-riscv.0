Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUUEE-0008PI-SI
	for mharc-qemu-riscv@gnu.org; Thu, 08 Apr 2021 08:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUUED-0008O3-4Z; Thu, 08 Apr 2021 08:57:45 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lUUE7-0004Cy-EY; Thu, 08 Apr 2021 08:57:44 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id v3so217120ybi.1;
 Thu, 08 Apr 2021 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r//7tcx0xlmshnf883CSDQJNDU8B0gd6TUykawSoQjQ=;
 b=uGjkxSt0ZoOLfP19uIQ7u4Mf+Sssl91ed4u1ziVa2r5vDfLcG/3vaT7IP9Md+9exj0
 43ca2ZvWluhpeVruupFnDwvWZRcAtsGP+brEN2akG5s2bRQjSGR9UJKl9JL1G9uZ3jmR
 1/LIgFriBiN53ne79B8leKXDXRPqZCsez0nu+UMAjLdDkdYUjXC9NR0XLOa5PNrmUB1y
 ppqcZComqerfDskhLGzRwcuAxjnBnC1dblhhXEKrrOk+Qq12bYAdD4mBz5pR714lvOPw
 UX5NJQq6LwLfV2gZHaeAm6IkmZf/khwQNnMl4d1uenbc3l81FgjoB6yIAMyk2GTf1Bgo
 ph5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r//7tcx0xlmshnf883CSDQJNDU8B0gd6TUykawSoQjQ=;
 b=ryMFDgpMioTHzR8YXwu4KRH7OZ+yvVZvRVOScdb20qc/qHFCySgRHaw8DkJ+5bFpXo
 WQwZvV59ArqucpOe9btJBmf6KAdHcWmVLoiydxvmFi9dWwQgLXvwwi7TFiR/Prsl9kz1
 y3qUNWcYhDBEbaWgKgsxD09mZSYvHnINskoeBnEUAD/Cz/CJVMyBoiRdXCYzNgMFYMlA
 usyQqZVW4hLGTPn/PBUN43FVd76NNbjdYylyTnFf3HvGmm4hPw0FRAh3SzHf2dERrKeW
 bR/T+gnd6BJNum4WEbGm7P05KRbGo5XniHaFCKYrIheVeSQaUrj6t44hULNgCfVpCEOv
 XiiA==
X-Gm-Message-State: AOAM531yYDEHRN8kYCP6U66IwDGRT53r/AsTPikWSAtSweRyOQ9XV1g+
 +epMZ+rzcK65Ct/32GcyYixDjUG3+BVST7coW9o=
X-Google-Smtp-Source: ABdhPJz4osEZebQ723Ma8FubFhOIzASvi37wb2FSfxy1xpNLRBHDEyehdS49JE6weyYkZsQnZKugBEVT6s5b4aVnKUk=
X-Received: by 2002:a25:afca:: with SMTP id d10mr10612469ybj.517.1617886653066; 
 Thu, 08 Apr 2021 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <8c6c6c2e9feb7709b5d23eee57d96e322ac8e5a7.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <8c6c6c2e9feb7709b5d23eee57d96e322ac8e5a7.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Apr 2021 20:57:21 +0800
Message-ID: <CAEUhbmX6LCmkyLt2Ae95J6mhGpk3AGD+PNV7TuWAV1K58+4KCQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] target/riscv: Add ePMP CSR access functions
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Thu, 08 Apr 2021 12:57:45 -0000

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Message-Id: <SG2PR02MB26348FDC30678B3177B5CF3893450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> [ Changes by AF:
>  - Rebase on master
>  - Fix build errors
>  - Fix some style issues
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  1 +
>  target/riscv/pmp.h        | 14 ++++++++++++++
>  target/riscv/csr.c        | 22 ++++++++++++++++++++++
>  target/riscv/pmp.c        | 34 ++++++++++++++++++++++++++++++++++
>  target/riscv/trace-events |  3 +++
>  5 files changed, 74 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

