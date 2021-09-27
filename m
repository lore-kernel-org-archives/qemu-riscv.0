Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUser-0004kj-PT
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 11:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUsep-0004kD-HM; Mon, 27 Sep 2021 11:35:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUsen-00060x-Ps; Mon, 27 Sep 2021 11:35:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so52813642wri.1;
 Mon, 27 Sep 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSvz1APDPaA4vE2/ttrlWYJ4sT71ydTv6e3uUBDFbQU=;
 b=LuUStK0hTPZRwFt5yJhhpnFdwQUkbM+0iKs+4ASzCWYoI4b9h2pdHbKhO+bwItLfiN
 zXMc1zmCCfzWfAdqEF+7FHhADt6J2RjajifatdOldYKAGTmMbfc+wg5cKik5yL4VdgKf
 DZTqhyXqzWeSGFl3dRKG9W17BCmZy/qt0o1sZW9SnXmKJNkLG8WqPdDu8t4Me82gz5yL
 lPrKeezzbEy6m0UXZfAbsVTLWstw2fjfIlQ4C+KUuDm8QRdkXu0L1U6pQXpSfeanu2q2
 1m6jt2jg6MsSe25oqrQYeLrZ1BRiseQRDmVzxd27vY4F3KRravycw75kJUbhJa8Vx4My
 +lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XSvz1APDPaA4vE2/ttrlWYJ4sT71ydTv6e3uUBDFbQU=;
 b=NxDVesvSYpZvOBfIRGgXB8GaDbs6pCjquxzGtc9I05EogyohIt8zu+Stjpvh80XPob
 20/yN+KX9X5UpHD9NP7IEFAXl9nBCWw4FmfmThH2v6799ngbi7mtO0HEkotSIDLE2sFK
 UaDdtyrnFDtpRxEFCbcz7yKwYwFwtSc8UY6GoXxecWCLC5F9lAJkAz6gBwUZMzfDfEq9
 APqAwgnxDegKev7THiKKcb4IPnrSHz2ag1DCDBXyp1yIWYKDxIU4Gx2x/ILt+Et58k0x
 1jFDx6tSybrlLSYW3z90N1+rbrG7AArWz8afsjyBDfHAFtl3zBeDWJyUrld08QXuvZSV
 tYJg==
X-Gm-Message-State: AOAM5326Et4jYV3xcKClrGcmEuYDgLx74gRk3F+BlZWldlsUFwYw9kQX
 jBdhlIZmkanLlbDJ4jCc++I=
X-Google-Smtp-Source: ABdhPJzpRtMelcAJ5/4tjPCqxbOiWkfQKntnmGR1U7kwPw5Nz5svMi1Sn5M7PZvLBTIYHSxlibRB1Q==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr520132wrt.267.1632756902872; 
 Mon, 27 Sep 2021 08:35:02 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v18sm16611640wml.44.2021.09.27.08.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 08:35:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <8e03f4a4-a47e-5e89-795a-d6d331c88cbf@amsat.org>
Date: Mon, 27 Sep 2021 17:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 1/1] hw/riscv: shakti_c: Mark as not user creatable
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <bc032f02f44192bfa057cc4f09311fd18d07ef1f.1632726758.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
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
X-List-Received-Date: Mon, 27 Sep 2021 15:35:07 -0000

Hi Alistair,

On 9/27/21 09:13, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Mark the shakti_c machine as not user creatable as it uses serial_hd.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/shakti_c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 2f084d3c8d..603992d442 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -150,6 +150,8 @@ static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->realize = shakti_c_soc_state_realize;
> +    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
> +    dc->user_creatable = false;

I agree with the logical change, but not totally with the comment.
Well, the comment itself is not incorrect. But the error happens before:

ERROR:tcg/tcg.c:479:tcg_register_thread: assertion failed: (n <
tcg_max_ctxs)

The reason is TYPE_RISCV_HART_ARRAY creates CPUs in
riscv_hart_realize(), and this machine use the default CPU limit
of one CPU:

static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
{
    MachineClass *mc = MACHINE_CLASS(klass);
    mc->desc = "RISC-V Board compatible with Shakti SDK";
    mc->init = shakti_c_machine_state_init;
    mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
}

The default values come from:

static void machine_class_base_init(ObjectClass *oc, void *data)
{
    MachineClass *mc = MACHINE_CLASS(oc);
    mc->max_cpus = mc->max_cpus ?: 1;
    mc->min_cpus = mc->min_cpus ?: 1;
    mc->default_cpus = mc->default_cpus ?: 1;

So the crash happens when we try to create the 2nd CPU.

>  }
>  
>  static void shakti_c_soc_instance_init(Object *obj)
> 

