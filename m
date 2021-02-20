Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDYXr-0004a5-6z
	for mharc-qemu-riscv@gnu.org; Sat, 20 Feb 2021 15:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYXp-0004Zk-RX; Sat, 20 Feb 2021 15:08:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYXo-0001pO-AC; Sat, 20 Feb 2021 15:08:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id n10so10823339wmq.0;
 Sat, 20 Feb 2021 12:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXEGjY9n5R6rdxOBT45/Z3IMqvgqpwaFVhPvSApDRF0=;
 b=PmkHLkb7HZ2ErCsBM+p4rhXxvUV77Hqr7IY8laMil0pvBRrFkM2l+n6XDENJzHtKBz
 9OFsBHXm3KRlTFwEqbd7/9S6aw1nayKBPerWp4fWDKuoyRv0elmrQ22aIDTaO+WKOSmn
 AutzFDiVSJJJIP6x+sxE4B4fzG8tPIc/sMjLyGTfM3poNdxaew27nm4auvBCPCuBXE5c
 lAhd/Z/+Vxo+Gm8CYmJcfFjxztsIHjQgyfOphU6/rqGzlj+fmVToKIzbjYn3PStmnCjR
 1aLtO8LRcWenRCJ0btyAmhtmfpNmkF4pGCeYZoSInXEqoLZ/oqnW6kVjLLGjSwdz0IOW
 tC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXEGjY9n5R6rdxOBT45/Z3IMqvgqpwaFVhPvSApDRF0=;
 b=XF+nnzMWTICyy0JM8ZgcwtXa7fSw7UXA0AQ0HYZCxcpJfW7ZrrOQKEXdN30HZy75bc
 LM0YvsNnCPcbPYGsyTNBKMop62iWTiVJh9X0gbrurPlAVb0iPUFl+2ebwZwyeHRwIX9J
 bYnXiBnw73nf1KzatwMVgDZSKJ4vhtqC5TIfAWSdfE5BHoF+JN9NaJS0IfWFBJ9BVSFO
 rgM789EcZJF6EndrCtLgEkTdz5uU7ORnkfcdL86pJUjXxWCoObzuui5CF3rluUWX+Zpj
 hJgb/YoLXfNtYEHFCQvDpqrpB/4+FktTUz+59FqFccsOmUYqh5uKBTEyo0Lb4irruaCl
 KmuA==
X-Gm-Message-State: AOAM533t7glRTp3rdw0Dsk9LCpBpOOlWfUBkHleOy1HMUghfB5iTtgoT
 wlJMYjAx/AKAJltph5RXnCQ=
X-Google-Smtp-Source: ABdhPJydvyfgkm+00aP4P4gHQA85ZApzFswiI/aY/KEJa1iPCRSaRIEzIY82gPjQtOJBA0wa2H+mDw==
X-Received: by 2002:a1c:4683:: with SMTP id t125mr13424316wma.75.1613851678173; 
 Sat, 20 Feb 2021 12:07:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b10sm12675188wmh.36.2021.02.20.12.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 12:07:57 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 3/6] target/mips: Include missing "tcg/tcg.h" header
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <84447dd6-466b-6c5e-126a-ea83f4582f5e@amsat.org>
Date: Sat, 20 Feb 2021 21:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210207232310.2505283-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 20 Feb 2021 20:08:02 -0000

On 2/8/21 12:23 AM, Philippe Mathieu-Daudé wrote:
> Commit 83be6b54123 ("Fix MSA instructions LD.<B|H|W|D> on big endian
> host") introduced use of typedef/prototypes declared in "tcg/tcg.h"
> without including it. This was not a problem because "tcg/tcg.h" is
> pulled in by "exec/cpu_ldst.h". To be able to remove this header
> there, we first need to include it here in op_helper.c, else we get:
> 
>   [222/337] Compiling C object libqemu-mips-softmmu.fa.p/target_mips_msa_helper.c.o
>   target/mips/msa_helper.c: In function ‘helper_msa_ld_b’:
>   target/mips/msa_helper.c:8214:9: error: unknown type name ‘TCGMemOpIdx’
>    8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
>         |         ^~~~~~~~~~~
>   target/mips/msa_helper.c:8224:5: note: in expansion of macro ‘MEMOP_IDX’
>    8224 |     MEMOP_IDX(DF_BYTE)
>         |     ^~~~~~~~~
>   target/mips/msa_helper.c:8214:26: error: implicit declaration of function ‘make_memop_idx’ [-Werror=implicit-function-declaration]
>    8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
>         |                          ^~~~~~~~~~~~~~
>   target/mips/msa_helper.c:8227:18: error: implicit declaration of function ‘helper_ret_ldub_mmu’ [-Werror=implicit-function-declaration]
>    8227 |     pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
>         |                  ^~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/msa_helper.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to mips-next.

