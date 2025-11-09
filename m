Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C075CCFA1A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 14:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI60X-00040X-0Y; Sun, 09 Nov 2025 09:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI60V-0003zt-P8
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:03:03 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI60U-0004HU-4t
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 09:03:03 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so3771054a12.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 06:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696980; x=1763301780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qrzRzagwL5bDzaG+Q6n8d2EmVX/zdXfhaUymKGnA4no=;
 b=ro25RNUrxECsyvrlmXemtQ2HEewg764nJtd0D3hqMRvbj3MEVzL3KjPlIZFRmxXrM8
 3h5urrlYJH2w//QKioDw9QHfAaTf2ZNXkqF2XnpkChx2q/6TGBlv7zoIjSxAbFufih8p
 E9Fhswve4ylu8HrrFaS9JmGGWjhXqVaLqmSW2GMZnkQjigK+6/XOO4nH80bXwAIb32gR
 AopHQgdKIM0fC9ThhtzGF+ZpcVVa28kVm03HhDLUweVbdGfGu/GgoXGhVrZzt5upSX4i
 KDzP1USBf9S/EILu4eIPDpOKvPrgCf8TZtW13uCCPJDGt5p+BQosXcEW0Xjzwu0rjvOj
 stFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696980; x=1763301780;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qrzRzagwL5bDzaG+Q6n8d2EmVX/zdXfhaUymKGnA4no=;
 b=dTLR3RZGPVeYAHRo0Nci++/OnO4tURnoiXXGgQTEksMyYnYjjbuOLUJGTtXsD+lqMN
 CdglZQnxsR6cBph2PNJyYkH3APVC3qKZcCbZGp2GhADIdLHImSXouLPnVp6SF/+caOvS
 LwPqFsNJl7DqmjwKMueNFpXc151lWSV+Pn6OH3JJZhGy6XVRwMuEdjJGJXcTtlg5zcS5
 w7GTHP8XNshHJ6eowmEItOZu4j3RtnnKLn+UwN445GI/WOCqnPnNEI6B+2EnbwAcVt/V
 WJ8/mh/ajF8CzgQ8oUgJhBuWAtxI3Q2hgNoRnvq/cKrMvk4Vv3ZV4JyMOm6QlFYqg+xV
 YyVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn/09rR48W+wcB2MHJvlXVY6JdbmInC54lcWKrPxqBUNoy82e0ZPFUR1Qea9wo5r7LG7AzfXT9An3O@nongnu.org
X-Gm-Message-State: AOJu0YwnQpPdAnKmsJhzF5Zwt6v9olg0/0vZuJKnPj4v127bLrST09zK
 JmpGbO8duB0IooHlnnvrkQ9ZY1TEd+Gk5KnKSQA9gQ767E8uNfmCm5fwiW0JMnfTYhQ=
X-Gm-Gg: ASbGnctcoDYrduPVG0Wt7WeUXuh5OtIaEjDjrpODK6z/bH97Jq3uwl4/Obq6dq8rDS3
 gWDwO+oZGAdrXQigeaqv/X/SheFK2VTKW/v46Pn6E5XrqvDE4t+F3Dk5oWEnNzYQVKsNS3oiQ0o
 GVhifuiRInZiNssSFWkMA13Vop+f+Aa4U228T6RBY3PAoNYVCZ9oUabawdFIaf8yEVpSxC3F+bx
 vSpgaK2xLPZkLh/9796lb4P3SDXYekOidY9blvJN7pCE1MqWg75S/jWVgvyJdDq6P90bOSjBbAY
 yTe+jdY/4VAH9KZVuK7zndcFwW5OoUl2QsAkhhXYOYV9AANsQ9c5AfbOjJfvyPwHZxAA+iTBELt
 kYwAiktznF9esaqi1v0QgJMQti31YpqkEDOC/V9t+wbJij0QqytowdGa5SUBNhIieRCaMtT3Hf7
 9Ou3WY/5dHyBeEut3fKfC5nAXlxz8hDGCyyP5Hs8ar6xgE7Ms=
X-Google-Smtp-Source: AGHT+IGFrG+0SGct9sPrlQHR8mNgW4nZ51qGGLpTPn0vGMz3Ll04Cd9+nYA379cCRViML1SwWPjExA==
X-Received: by 2002:a05:6402:278e:b0:640:d184:cf0e with SMTP id
 4fb4d7f45d1cf-6415e6edba9mr3940713a12.21.1762696980423; 
 Sun, 09 Nov 2025 06:03:00 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6412a27d68dsm8119554a12.9.2025.11.09.06.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 06:02:59 -0800 (PST)
Message-ID: <29b2e852-f273-4c2a-b356-4380775d8f54@linaro.org>
Date: Sun, 9 Nov 2025 15:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] target/riscv: add the RISCVCPUTimeSrcIf interface
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-5-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-5-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/11/25 11:23, Luc Michel wrote:
> Add the RISCVCPUTimeSrcIf QOM interface to the RISC-V target. This
> interface aims at replacing the existing env->rdtime_fn callback in the
> RISC-V CPU env. It allows to query the current number of ticks, and the
> tick frequency.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   target/riscv/cpu-qom.h     | 34 ++++++++++++++++++++++++++++++++++
>   target/riscv/time_helper.h | 16 ++++++++++++++++
>   target/riscv/time_helper.c | 13 +++++++++++++
>   3 files changed, 63 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 75f4e434085..e5bc23b2ef5 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -58,6 +58,40 @@
>   #define TYPE_RISCV_CPU_XIANGSHAN_KMH    RISCV_CPU_TYPE_NAME("xiangshan-kunminghu")
>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>   
> +#define TYPE_RISCV_CPU_TIME_SRC_IF "riscv-cpu-time-src-if"
> +
> +typedef struct RISCVCPUTimeSrcIfClass RISCVCPUTimeSrcIfClass;
> +DECLARE_CLASS_CHECKERS(RISCVCPUTimeSrcIfClass, RISCV_CPU_TIME_SRC_IF,
> +                       TYPE_RISCV_CPU_TIME_SRC_IF)
> +#define RISCV_CPU_TIME_SRC_IF(obj) \
> +        INTERFACE_CHECK(RISCVCPUTimeSrcIf, (obj), TYPE_RISCV_CPU_TIME_SRC_IF)
> +
> +typedef struct RISCVCPUTimeSrcIf RISCVCPUTimeSrcIf;
> +
> +/**
> + * RISCVCPUTimeSrcIf interface
> + *
> + * This interface is used by CPUs implementing the sstc extension. When the CPU
> + * implements this extension, it must have a time source to implement the sstc
> + * timers. Devices implementing this interface provide a monotonic tick counter
> + * and the associated tick frequency so that the CPU code can compute timer
> + * deadlines.
> + */
> +struct RISCVCPUTimeSrcIfClass {
> +    InterfaceClass parent_class;
> +
> +    /**
> +     * get_ticks: get the current value of the free running counter associated
> +     * with this time source.
> +     */
> +    uint64_t (*get_ticks)(RISCVCPUTimeSrcIf *);
> +
> +    /**
> +     * get_tick_freq: get the tick frequency of this time source.
> +     */
> +    uint32_t (*get_tick_freq)(RISCVCPUTimeSrcIf *);
> +};

Thanks for the documentation :)

> diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> index af1f634f890..b51fdd96570 100644
> --- a/target/riscv/time_helper.h
> +++ b/target/riscv/time_helper.h
> @@ -26,6 +26,22 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>                                  uint64_t timecmp, uint64_t delta,
>                                  uint32_t timer_irq);
>   void riscv_timer_stce_changed(CPURISCVState *env, bool is_m_mode, bool enable);
>   void riscv_timer_init(RISCVCPU *cpu);
>   
> +static inline uint64_t riscv_cpu_time_src_get_ticks(RISCVCPUTimeSrcIf *src)
> +{
> +    RISCVCPUTimeSrcIfClass *rctsc = RISCV_CPU_TIME_SRC_IF_GET_CLASS(src);
> +
> +    g_assert(rctsc->get_ticks != NULL);
> +    return rctsc->get_ticks(src);
> +}
> +
> +static inline uint32_t riscv_cpu_time_src_get_tick_freq(RISCVCPUTimeSrcIf *src)
> +{
> +    RISCVCPUTimeSrcIfClass *rctsc = RISCV_CPU_TIME_SRC_IF_GET_CLASS(src);
> +
> +    g_assert(rctsc->get_tick_freq != NULL);
> +    return rctsc->get_tick_freq(src);
> +}

Why inlining these functions? Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


