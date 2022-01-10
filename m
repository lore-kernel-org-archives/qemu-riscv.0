Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n73l8-0000Az-A8
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 18:07:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73l3-00009Z-Na; Mon, 10 Jan 2022 18:07:21 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=44800
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n73l2-0005Ad-Ao; Mon, 10 Jan 2022 18:07:21 -0500
Received: by mail-io1-xd2d.google.com with SMTP id h23so19802139iol.11;
 Mon, 10 Jan 2022 15:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yk6Bcu1fitpNUpPqU1IkNlHV7SkcpGxAs+8b8ya+Jw=;
 b=kp5nhNlVfP5cUSmergeH2yUe2An8sATSkHa4jRRtTrVAMYvQZP/FZNWmKHZ3qOcRIc
 L6U/5IGi6b/ysGAvkNSykzQHtPz7peRkZwVymngeuQnIKWEdZKgMSwoAvZYAZ9tA/xh4
 LZwpz7vNXH0sXSmoBV0I5ELJCvN7753ZKRBHnRMCdHO6XxfciAKiFRbd6Xc9vnhZ+Ufv
 1PvBGG1LfDONWRH23TWZfGj2LKvhxAjydIw4UzIvxRpvJFQt9OAAEoCW3AFDyj2BMClX
 iv6pQGmRzhCB6wpQjOOc6vAPugTvrfLiYoN/1vQy3qHds667CJ4CspDZxJvLiKGpgma2
 n3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yk6Bcu1fitpNUpPqU1IkNlHV7SkcpGxAs+8b8ya+Jw=;
 b=kl9jkqU5Pv9gDzMJS1dQHiPzcUnBIBkUBtUxN1cNvQiPwKCkJOOyi5KGpFPBoSKFRM
 aeoi4kY0V4wsZMH7/oR9NQ5a3XF39TJON3R9x7RxzwnFFjx6ybb8ZzubMMBt1dVavFno
 QmiBassev2Gl92eEdniy3/RONjvSaU0TkKufH9vjRadNsRziW6HqwXvjuG/tRstLTtgW
 v0JJIV1KVMrAd4zbLvtq8Cn15a6hSg6HxouAEfzBjv6cMdLSor8+W0+AXnSFtw9KXLhe
 YF2yLAO5o8u3Q4LqVDu8VPwc0wvpfVzW3KO51mYhMD+08rO0+wzuMsfityx21yP+MP1w
 4G9Q==
X-Gm-Message-State: AOAM533PTCVJTZ2G37RQiv8qOyNQY1r2XfeHOh7w9PpNuvXn4chyVKH2
 pHU4lHt57NlIZzs+evdnqLk7pJ2M2xNMPyOfKgg=
X-Google-Smtp-Source: ABdhPJzwjiMQFRGUsTNJWfxyanbFpK/E3qPuRVxLdqjeusRLwOMQDlDT2t/VSj7mrqld5jzDVwQcC+4z1iWgVrrDbFs=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr922733iov.187.1641856032412; 
 Mon, 10 Jan 2022 15:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-6-jiangyifei@huawei.com>
In-Reply-To: <20220110013831.1594-6-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 09:06:46 +1000
Message-ID: <CAKmqyKPsSidxir_1fncugsmLK33aSbHk63MP0JnS3OJLvy65EA@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] target/riscv: Implement kvm_arch_put_registers
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, 
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 23:07:25 -0000

On Mon, Jan 10, 2022 at 11:57 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/kvm.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6d4df0ef6d..e695b91dc7 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -73,6 +73,14 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)

This fails checkpatch. I know there is lots of QEMU code like this,
but it probably should be `while (0)` to keep checkpatch happy.

Please run checkpatch on all the patches.

Alistair

