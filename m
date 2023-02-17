Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSosy-00005m-Mm
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 19:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSosp-000054-QL; Thu, 16 Feb 2023 19:45:53 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSoso-0005VF-5P; Thu, 16 Feb 2023 19:45:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id dn12so6112180edb.5;
 Thu, 16 Feb 2023 16:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G0X5zq2I+TYaTwXKINQ5eoOeXY/nc9n7n8FHUBPGzh4=;
 b=qZJoEiqIbHpm4vKdy149LPHzHQkLTjwRZDRIF/MuICwVwZO4yl+1W9qse894NvHRDz
 esuIN/451w5AuJhFTA+c6PO4QhgnJ/docoQeA+xcKI3geqUBEvPbnZYiNoTVCFTKOq0D
 4iVLG7kSmLoWopNLadDEX61yQRWeAT85MAN/aL+ifn/V+wP+tvHbX1mw4Hce8qMOJyfM
 i3bSN1ecjNRgEcnowuvMRLXwezq1L3s8pZkWH5sXwWQnHm63dN0li1296yln7NXiFujE
 MobmiBNke9aLzOmTAYSGWNsMRxQA4LqaPjtXqm5Ysw6aZfu6b91zG0C2S3xIWdx0lvic
 E+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G0X5zq2I+TYaTwXKINQ5eoOeXY/nc9n7n8FHUBPGzh4=;
 b=pOwlDl046HzNbdyV01hFt9l0+JyVQosdlNutHhMtMpuhGEX7oSiP7lhVGXDDkQPEMv
 cFi2DNOMlMGlrWshlKT7CPd8jWLplY0XimKDhzJrIR0mKWkbUGKmqykBEMIqiTRFJMB1
 4yPXeb/4TvN8kp/hawMlzKSRHF1GAYGGNJWQFb0Rr1jjIR93n14926jXurJiRGytM5Q5
 ryi4Xddon1OaUthhJz3Em0+2tDGykP9NchD/MnFAE/sQCtNu/b6rsn5/fcw3t1S4MBdF
 BtznHZFvHh5iSa+caaDncNs6n1gBKznQiIi4K6QCgyACGGLz4fDNp+E+VEr4H0xmLWEF
 Q/hA==
X-Gm-Message-State: AO0yUKUnok1h9fDZmYsM4EDP3k4IbPk4xAlD0STUHUZVlk5cWt4CLqBE
 dyOwZlbrWgoSDwyQlvI6FbUGwRxOw2NVstVk1Q0=
X-Google-Smtp-Source: AK7set9n4z9FLim8bECY6COIkWhbzd9knShagEsWT3lJguhChAWMjdkFqJ/K6GcTOM/q5fe6qN6WXw8f4c7cqAr0K5I=
X-Received: by 2002:a50:934d:0:b0:4ac:8359:e846 with SMTP id
 n13-20020a50934d000000b004ac8359e846mr4090571eda.6.1676594747888; Thu, 16 Feb
 2023 16:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230216215550.1011637-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 17 Feb 2023 08:45:36 +0800
Message-ID: <CAEUhbmVQa=A4CXT=hhN_NNaq2ObbZ3e13GJB+7UJ3H+-qMsOyw@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 00:45:59 -0000

On Fri, Feb 17, 2023 at 5:57 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're going to do changes that requires accessing the RISCVCPUConfig
> struct from the RISCVCPU, having access only to a CPURISCVState 'env'
> pointer. Add a helper to make the code easier to read.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h | 5 +++++
>  1 file changed, 5 insertions(+)
>

Looks like the RB tag is missing somehow?

Reviewed-by: Bin Meng <bmeng@tinylab.org>

