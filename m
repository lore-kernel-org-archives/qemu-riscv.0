Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onyCV-0003WJ-CY
	for mharc-qemu-riscv@gnu.org; Thu, 27 Oct 2022 04:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1onyCO-00037D-KG
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 04:25:14 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1onyCK-0005Gq-2b
 for qemu-riscv@nongnu.org; Thu, 27 Oct 2022 04:25:10 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b79so803198iof.5
 for <qemu-riscv@nongnu.org>; Thu, 27 Oct 2022 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fNh0TvJ3DAqdIqSyjHNKnV6UOL33eXa20RyZF4Egqww=;
 b=WmN+GopVJ1/r4JNGmHf5iz8IiDCnzysxMMptQqcTAEzHBiwWH+n1q7ceenD5nowUu2
 gLcYJvzWWOqsGZ/5T+7QrS7XMMNQ5mi0JtA83D3J20SDoO9S5w+wYnw1zMpLPmAAk/3s
 ItWqfc3chITIfx/WKqUlBN/nQusKyD7h6SSkMiaLLu2BoRhEtCM33ySYfg/gP9J3JmP9
 CMWfh9dVvsY1+2nXcyqcI443IUcWnhJForaKBb5SMVGL59FeXF2Ngml/isVD4Rl80Hws
 zaUP0dThCHTTTL1ReDYepXFc7Yoo9hPYZ8eW4uXGEA+bGNEbIx/lw2013XrGvvzBxC0Z
 9tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNh0TvJ3DAqdIqSyjHNKnV6UOL33eXa20RyZF4Egqww=;
 b=mFP580cl8GqmoXmfE4Gp2/khmYszNbsiG0JGkzXYCRWdpqhsuSakYcsymTRXPCFlPO
 6GklmiHl6TMV1XRhw1nhm12l2/CW7wLMgtaX60Sybr3FNwNKYZwiL/suczviM6WLQLM4
 Bh+iDABX3p+WFNXlwP1ePkCTt0UjrxZpfppPqfA3yHvnJosny/5bLv8PA6iYFoW/UKyk
 dm9uRaLW4wwVElAnYtXGNq/o864YQXDVGtqRT96oqANUoHe+qaSoRuY+ncfHZao5yYRV
 IoQ8tx2j4JkZky6SQCqCnGR0/DwzvJy3Bv6xKGmIm8XcnUM+OXVM14pPH3cJmkHBVUIe
 QhwQ==
X-Gm-Message-State: ACrzQf2jkRk8C3KnwnIcbw9nZfHoXqI8bhOm3wlb4ZJ3POB9d8EwmZ/m
 OQhsGt1B+jGVNZd4t4gTCw/NAS6BYP/fvfR58hF3cg==
X-Google-Smtp-Source: AMsMyM6N7Y15xviVgxNz2vy6cJdYURd+2aqoFKObOyT7aqpkwHilbPJs2GFoqPfS+IMnlZf7AJjmmvKDoIdq8KeL4mo=
X-Received: by 2002:a05:6638:2646:b0:374:f6f6:2e12 with SMTP id
 n6-20020a056638264600b00374f6f62e12mr10042992jat.182.1666859104109; Thu, 27
 Oct 2022 01:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221027054649.69228-1-mchitale@ventanamicro.com>
In-Reply-To: <20221027054649.69228-1-mchitale@ventanamicro.com>
From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 10:24:53 +0200
Message-ID: <CAF--n8oFpSdtnFgXy0rvHfUk8w1cMori_wZmxRb8RHKnogcSmQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] target/riscv: Apply KVM policy to ISA extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=ajones@ventanamicro.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 08:25:14 -0000

On Thu, Oct 27, 2022 at 7:52 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Currently the single and multi letter ISA extensions exposed to the guest
> vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
> and applies policies set in KVM to the extensions exposed to the guest.
>
> Mayuresh Chitale (3):
>   update-linux-headers: Version 6.1-rc2
>   target/riscv: Extend isa_ext_data for single letter extensions
>   target/riscv: kvm: Support selecting VCPU extensions
>

I already reviewed this internally and it hasn't changed, so

for the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

