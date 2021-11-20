Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moPQW-0002sh-LI
	for mharc-qemu-riscv@gnu.org; Sat, 20 Nov 2021 07:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1moPQU-0002p1-RJ; Sat, 20 Nov 2021 07:25:02 -0500
Received: from [2a00:1450:4864:20::331] (port=43864
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1moPQS-0007M0-Qw; Sat, 20 Nov 2021 07:25:02 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so672232wmc.2; 
 Sat, 20 Nov 2021 04:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k4t/moyFPTnHr3tkMLXdwzp25OETETV91StNXhkcfik=;
 b=mTt0jFk99R2Hwmx6XtvgMNqXkKwzzU/oAFpisDMSKhRsdclK3eNa5imnm7YU1wQB/N
 DeliNaskMhSb/BnpkkkRqnVQlYONk77YC/IvM8NpN7SOijehD4mtQPpawUl8aTDll4Yq
 v4LvStzkKeZqpEbd7T832AZqX/9YzwQyvhiE+v7UtxQ+9Y7+KPn4F3k+7wEacgdxc1qw
 qTg8seqVVJklVhR78mMVC4RbnLE0GbA2xu9dCVgAz+/QeJk7HylDumSo30RrRoKrznoc
 sxtU801bzcYKU3zi6Fe7r+D2upCgVv6P4+OeBlnrwDXvhPMbOtksThBtpmb1K3+ajzUs
 jn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k4t/moyFPTnHr3tkMLXdwzp25OETETV91StNXhkcfik=;
 b=U5+uorqvWhif7TrLlvb4YVD1x5e/EiV+Zc85EUttI4LBwGx2VYNwJBKXknI/mA6yP0
 YHoq0U+XFbfh+Nz8dOBqqHo8ENoto1KIsFpz8mv7+fHC4f4i5tfpWfbsm+vo/dpOEsc1
 KRRP2GEz9dQFd7q9pWbSHzDV6YmOEgLeJjMyQdO6B9P66pQcOYxeHKP/PDUmAUQwRXve
 OcCfkZXqe8sHEuR4RrDnnNZa6iHxbtNDc8Qb0SK8FLZAwbxm66Xcai5wyfY+0+3BJKRS
 W3noiIrE+nh+zCYYGdZqRRn32Kv0IKpiFU9ohHq9QJLlKRyXKf6/VaFm+oxs6fBWLQne
 emIA==
X-Gm-Message-State: AOAM533WfDPJhXJnxDpbXag9h4Us7yOO2jR9CopZSxn4/twbYD/jPGs1
 Ka8lIkiXO3zNwldhnPS9QLk=
X-Google-Smtp-Source: ABdhPJy74oP1WqfRYny5eO9aXcR0fnFrgZXOV0i6XL8EyY0WicsV91rMm7YQV/K2FH+SnMgCAUJXew==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr9908447wms.44.1637411099258; 
 Sat, 20 Nov 2021 04:24:59 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g13sm2698002wmk.37.2021.11.20.04.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 04:24:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <afe5b14f-ec27-2722-73a8-b9f6716d207e@amsat.org>
Date: Sat, 20 Nov 2021 13:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
Content-Language: en-US
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair.Francis@wdc.com, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, palmer@dabbelt.com, fanliang@huawei.com,
 wu.wubin@huawei.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-9-jiangyifei@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211120074644.729-9-jiangyifei@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 20 Nov 2021 12:25:03 -0000

Hi,

On 11/20/21 08:46, Yifei Jiang wrote:
> Use char-fe to handle console sbi call, which implement early
> console io while apply 'earlycon=sbi' into kernel parameters.
> 
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/kvm.c                 | 42 ++++++++++++++++-
>  target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/sbi_ecall_interface.h
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 8da2648d1a..6d419ba02e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,8 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> +#include "sbi_ecall_interface.h"
> +#include "chardev/char-fe.h"
>  
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -440,9 +442,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
>      return true;
>  }
>  
> +static int kvm_riscv_handle_sbi(struct kvm_run *run)
> +{
> +    int ret = 0;
> +    unsigned char ch;
> +    switch (run->riscv_sbi.extension_id) {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        ch = run->riscv_sbi.args[0];
> +        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
> +        break;
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
> +        if (ret == sizeof(ch)) {
> +            run->riscv_sbi.args[0] = ch;
> +        } else {
> +            run->riscv_sbi.args[0] = -1;
> +        }
> +        break;

Shouldn't this code use the Semihosting Console API from
"semihosting/console.h" instead?

