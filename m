Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAL88-0004m8-3G
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 20:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1pAJ1L-0000bc-G8
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 18:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1pAJ1H-0003ON-IS
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 18:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672182361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tXVyQqDkxu1fM+EkJnDNhfTB/82eh947s37iNeKwGH4=;
 b=cyB+r9GKrLMl16eHLCvvyBG0IjHIHh6FL1JsMw/dkhS1ZVHNCqITeCJzXkzPanigu6pxKB
 lcPyvvs1UqQYCSB4KYLTvtAhWm8IpXEe+J4XVSBnjdSxQXcdA3b01aYeviLxogqN1SQU9J
 a9uSYwoSbNUfJUGFmGfn0Ih4MhqFJ9Q=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-XmcRFp7dPOOZLQAwl2O_9A-1; Tue, 27 Dec 2022 18:04:27 -0500
X-MC-Unique: XmcRFp7dPOOZLQAwl2O_9A-1
Received: by mail-ot1-f71.google.com with SMTP id
 u11-20020a9d4d8b000000b006782ebb9bf5so8325580otk.11
 for <qemu-riscv@nongnu.org>; Tue, 27 Dec 2022 15:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXVyQqDkxu1fM+EkJnDNhfTB/82eh947s37iNeKwGH4=;
 b=NBQZXyVu7+qO6h0dNKuUPLw5tYhjfwVYmDGLyNJ9cG6RYljXwRHNF3eQp57h+7mb4J
 LxPU9qrBEsfBlerlA6RIjg8GlQcwfuA8ZcmA1smUm4pHSJ/E9e6JoBi21uafMUqPBTNj
 +dWF+Fwbd97JSiXZLmKt8yL04/iWVXrBGSH5epaH7xbQN6HNtzfPzp1t/1SE3lh2XDxL
 4tl/f2UsMYLQ11HAaimDCzoomAC6R2g1LgzUNUtMgj3HDHmL+K01nQBv5YnFJnpFCcyo
 MaTyDcpuG4TdOXuwRBfLrI/LabGvb+PyprqkSuz6akiIK4UQ6I0xgEJpgdCzYvOrOrjn
 5ckQ==
X-Gm-Message-State: AFqh2kpLYRuTfQBNpQ4OHIPmkfBYde1h4ueDGPsDb+5edV2/WzOwpn1N
 ceWOOnudNbS41n9CJyH62TLYibdreg62hj+xq6L3lWyZGy4aHhPEqmgHHetP78SA5s2C9BgOm3V
 5CL0TkVqV0PM3iu4=
X-Received: by 2002:a05:6871:4595:b0:143:95b0:26e7 with SMTP id
 nl21-20020a056871459500b0014395b026e7mr10441759oab.54.1672182266788; 
 Tue, 27 Dec 2022 15:04:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv0uiUyOImN/HL+0CJBl2eJKp2Fvo33FTWTtnx6WjcWui3GMXxC6lAtcPaRXLbFdRz33wMAxg==
X-Received: by 2002:a05:6871:4595:b0:143:95b0:26e7 with SMTP id
 nl21-20020a056871459500b0014395b026e7mr10441745oab.54.1672182266491; 
 Tue, 27 Dec 2022 15:04:26 -0800 (PST)
Received: from [192.168.1.107] ([187.23.180.75])
 by smtp.gmail.com with ESMTPSA id
 z36-20020a056870462400b00144e6ffe9e5sm6638168oao.47.2022.12.27.15.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 15:04:25 -0800 (PST)
Message-ID: <d8d4abc7-b4b1-7c63-c02d-76ef9776947b@redhat.com>
Date: Tue, 27 Dec 2022 20:04:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Reply-To: wainersm@redhat.com
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
In-Reply-To: <20221221182300.307900-2-dbarboza@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Dec 2022 20:21:13 -0500
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
X-List-Received-Date: Tue, 27 Dec 2022 23:06:07 -0000

Hi Daniel,

On 12/21/22 15:22, Daniel Henrique Barboza wrote:
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
>
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Cc: Beraldo Leal <bleal@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 tests/avocado/riscv_opensbi.py

It looks good to me. Thanks!

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi.py
> new file mode 100644
> index 0000000000..abc99ced30
> --- /dev/null
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -0,0 +1,65 @@
> +# opensbi boot test for RISC-V machines
> +#
> +# Copyright (c) 2022, Ventana Micro
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +
> +class RiscvOpensbi(QemuSystemTest):
> +    """
> +    :avocado: tags=accel:tcg
> +    """
> +    timeout = 5
> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:virt
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv64_spike(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:spike
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv64_sifive_u(self):
> +        """
> +        :avocado: tags=arch:riscv64
> +        :avocado: tags=machine:sifive_u
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv32_virt(self):
> +        """
> +        :avocado: tags=arch:riscv32
> +        :avocado: tags=machine:virt
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv32_sifive_u(self):
> +        """
> +        :avocado: tags=arch:riscv32
> +        :avocado: tags=machine:sifive_u
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')


