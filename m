Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvWw-0004hI-Rr
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvWt-0004gz-8w; Wed, 05 Apr 2023 01:17:55 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvWn-0003kJ-PQ; Wed, 05 Apr 2023 01:17:54 -0400
Received: by mail-ua1-x933.google.com with SMTP id l23so6007004uac.6;
 Tue, 04 Apr 2023 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680671868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5IpNVf9RcAKYb/WTk5eRmOZLd9jQiuA8kUH+zUbTGg=;
 b=PkY3S4SFRgMTIr/7ngJ3sLkYMFR++AEzKRjRiF+3ETpKna1lnm8n41bePm2WNSgxJO
 1KLPHHv7aarqm/OvaReHL1wPsfWY9SaUFRkosiSJ3kEfpU9/WiOZuQcHuJZRS9JQqDKq
 9rq+op6Xj5GvAUnbzZiZOLVj46CkDnrUgxaodg5nVz1Cj9kEKRGUzYzTO0apQb5jzikl
 pOHrABgUkEqleVhkVMDDe+8JdCnKF5SCPWAA/TRALToHe29LWd7yp5Af3w7skvEqEGX3
 UVDgFswyYVjbB+WDYqStkERNctEUDNdVdHm9cJNxxh8mFkOVpPeI8tx+O1n21owfV8oJ
 Gm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680671868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5IpNVf9RcAKYb/WTk5eRmOZLd9jQiuA8kUH+zUbTGg=;
 b=KyQMzBzj10DaLnWSKV7gcIR4JGoP/uD1pyj/O7af/F3ejlhyA1QIkxx0uDxlHJpTC6
 WQ2BFoDemB5nrS2ZtoSYOGOKyimkZL7WuS08UX/dvGIIsyU0sMKir5lXb5ywTlamZIKv
 Mgq0VQZUxPxL5PDa2axeV7oKPJdFLbRsiQVWbZKqxf3OyDePZa8NoHx8huKVUfp3qk7w
 cwxb2Z9U8eHsKhBst20EF6uKmhhYdc6dqmJ+qs0FvbKeQazdRmAEJonGFPrqRF7cKArX
 76Ge4/7Kq6stRUHe6kzZC+ejv2kd2oWPoTL8584L8Pn8K3MNP0CWdMRAVkX45fv1h0lh
 6Xzg==
X-Gm-Message-State: AAQBX9dwwRxn46DIy+RlOgatAfT7n8esXlxQNe3A9DZVPEZjE612TGaT
 W5keGcMZa1iSXbcqvJQgIhZ5bLKpluruyCgTC3A=
X-Google-Smtp-Source: AKy350b3Hvk3ULkYOJCNItdAMqnhTJ/5BrTySkvMTYBHYeji8PKR/jm+gb9TwsfG02owSJrVBS1aj68fvTT45YL5G0w=
X-Received: by 2002:a1f:2147:0:b0:40c:4d1:b550 with SMTP id
 h68-20020a1f2147000000b0040c04d1b550mr3937054vkh.0.1680671868172; Tue, 04 Apr
 2023 22:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:17:21 +1000
Message-ID: <CAKmqyKOqtKXk6fhGV6N61-4J6ZbxpEQSWaigMrYWsg000TGWJA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] target/riscv: Remove redundant call to
 riscv_cpu_virt_enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Apr 2023 05:17:56 -0000

On Mon, Mar 27, 2023 at 6:11=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> The assignment is done under the condition riscv_cpu_virt_enabled()=3Dtru=
e.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 824f0cbd92..e140d6a8d0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1706,9 +1706,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  riscv_cpu_swap_hypervisor_regs(env);
>                  env->hstatus =3D set_field(env->hstatus, HSTATUS_SPVP,
>                                           env->priv);
> -                env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV,
> -                                         riscv_cpu_virt_enabled(env));
> -
> +                env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV, tr=
ue);
>
>                  htval =3D env->guest_phys_fault_addr;
>
> --
> 2.25.1
>
>

