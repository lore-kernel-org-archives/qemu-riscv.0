Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSgr5-0000IP-Hb
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgr4-0000Fh-00
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:11:30 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pSgr0-0003iH-Kz
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:11:29 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso2587867pjr.4
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=k79Gko0Q1kMwiwws/VU8+e329nHhshqEAiEA3h5Z1TU=;
 b=pexGYqTnwRoZVHW0uUmZ/ZkGpfYo44MG8JUw8B+2/Wj6fHOGjDa2zYnEoiJzCygT7m
 bcDqBVNR5Dm9aORNtETt4sKItxwD9b2gbJuGxNkuKxjllm5oa2S7m3puhqwr3d61I2z7
 GHD5HHGdZ19HSVLKoH7K7ktNdYw4rw5i/YAbTUyT3qEXMrx1gDl9ZsjgdGZt0RK6wYce
 ziszc+sFt98Eb8xm1LHYp4JbHHhG6x2GDOmuJbXEDyIv1KeqLNWrtiYMPQ8ps7WI3p7N
 KkR/GsgdHkq62GHsThoO78IiXZAE1cbAlXh7FD4MfEhN0r8uN+57KaOLYlA23plTPc8G
 21hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k79Gko0Q1kMwiwws/VU8+e329nHhshqEAiEA3h5Z1TU=;
 b=vDQPQTYRk/j7HmHEF+PlAITr1iCXACd7iwp2uc6HMiH/5jgVxRdfFis6LRw5K6QukK
 Ah5/Zr2dSw5sCY3IKwiuPlr2uUnMRqcsFMfpLWj37ZceV5y2HzvH6HWQ2I3rGF+7ovJU
 nHdZbwp4hbboE/3Ubrv2fKhM4XdgnE8xKqs+hJUo68AOLAQOt62v9fJIty7A0jA49iTf
 TsxTNgyto901HfFeKGoE9/Vz8H0tjmuqZNSGA0u8NFL+SYpKdj6gkENeoS5rEU7k6tqi
 XjIZH29QD/gO0ot8RnHp1MH/pWEOQQFl6pHcYOQMy2jKesmLzHdlytc0tzGpqVvuqsuE
 SUuA==
X-Gm-Message-State: AO0yUKWqWMJzsDCsMuEsjtW0qHIScAscLZOmJG/HsrGhEmVaAiDhE06G
 L5r3c5/1N3TY9FZ8QYadHdOojw==
X-Google-Smtp-Source: AK7set+yFjK2/rm3bIxZU3JIzSMnm/mB7Jf21hha7HqgBy1Ka3/w9bRx//+im4WPGTE14Oj2UOfkWQ==
X-Received: by 2002:a17:903:2c5:b0:19a:ebdf:1994 with SMTP id
 s5-20020a17090302c500b0019aebdf1994mr2919483plk.52.1676563884341; 
 Thu, 16 Feb 2023 08:11:24 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a6f32e6c1sm1523255plh.148.2023.02.16.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:11:23 -0800 (PST)
Date: Thu, 16 Feb 2023 08:11:23 -0800 (PST)
X-Google-Original-Date: Thu, 16 Feb 2023 08:08:27 PST (-0800)
Subject: Re: [PATCH] target/riscv: avoid env_archcpu() in
 cpu_get_tb_cpu_state()
In-Reply-To: <20230210123836.506286-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-31cc5368-ff22-4644-b6c0-7aecd425b60f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 16 Feb 2023 16:11:30 -0000

On Fri, 10 Feb 2023 04:38:36 PST (-0800), dbarboza@ventanamicro.com wrote:
> We have a RISCVCPU *cpu pointer available at the start of the function.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index ad8d82662c..3a9472a2ff 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -60,7 +60,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
>           * only when maxsz >= 8 bytes.
>           */
> -        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
>          uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
>          uint32_t maxsz = vlmax << sew;
>          bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&

Thanks, applied to riscv-to-apply.next

