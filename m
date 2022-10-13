Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiqZw-0008S5-Ul
	for mharc-qemu-riscv@gnu.org; Thu, 13 Oct 2022 01:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oiqZr-0008Qo-Os
 for qemu-riscv@nongnu.org; Thu, 13 Oct 2022 01:16:16 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oiqZf-000131-8r
 for qemu-riscv@nongnu.org; Thu, 13 Oct 2022 01:16:15 -0400
Received: by mail-vk1-xa33.google.com with SMTP id g85so292220vkf.10
 for <qemu-riscv@nongnu.org>; Wed, 12 Oct 2022 22:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
 :subject:references:in-reply-to:from:to:cc:subject:date:message-id
 :reply-to; bh=8jjzSbquCGIpZBdOT7nOgHDr2hdlUw8WRIsF1vsL4Nk=;
 b=UKqxWkfM/aMOqDYiA3dhhALbROWYdi3V8SUNyNVkCs0PTqmV52wr8cxoold1Ip2j70
 njd8Rq9HVQ1M6N4IJJj3lh1ZGnFJekZ0LqTJYq6odww9cAWdgqs8aNs1BwLvtH2jD68a
 UFjMmiUXXyDntoXChizYt9EfaT+oVLKmOQrS4H/IxbGj4yu6QhHnDV4Tb0tbIhMOZBGq
 +XB4Gw4YMwWBqMDS7PeTnlVTsqil42mhqHIDek3b4/uJC8SDS2x1yRWenHwmrpyxl482
 6tnDZ8GmiKAI6/wm4fXhUTwSXyfg6J6T+cS8eWTeM7dAmkh9ScweSoudEiHi21BFahja
 MTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
 :subject:references:in-reply-to:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8jjzSbquCGIpZBdOT7nOgHDr2hdlUw8WRIsF1vsL4Nk=;
 b=Zj9F/RY9MVL9YdBJHuTA/3h++JmDmi5unPnGDccvBlCXQdVcwZkSseKTx/O+MGii/1
 0PzBruMSegBlbPa3VgX3y8oFb6mkHe7ih6cjBCdnp3xGeqDMVb8HEhSi+ESa8Il5hB+v
 SIeIT91oVIcUD0iJj9MeOBagWcuqYChv0ehgT/Ax4EQtNNixGPle02uiu7FLLUUulm43
 s1kJeI1bGSSaIZB6bED2qRd6v5sQ2oFLiZ9VzL2N4/3q70gNP1UebKPOuobLbKe1ishV
 NiIc4hilQ1rw4kdSTr0Y5R967CUYZ7OwueojStEskvJKvZmDqQTRYTyP0NzR8JvWHkyY
 676w==
X-Gm-Message-State: ACrzQf1C0L2pkPJtOgRPSk+iXWEYtxdCaXsj6xcCTB6dOFUE7jOxmPb9
 AHi9Oslv4TG7Oco0Je/TNj8rjP2DzOz5KY78
X-Google-Smtp-Source: AMsMyM7n13PJvUAYFtfq5Tw2ZISk2AiYMgqsFCw4SHVk4/QZn3nYBJI6UNk4g+wo3EqfDTnMhqMd4w==
X-Received: by 2002:a17:902:ef51:b0:180:7922:ce40 with SMTP id
 e17-20020a170902ef5100b001807922ce40mr28773522plx.8.1665638149701; 
 Wed, 12 Oct 2022 22:15:49 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 24-20020a631558000000b0045feab454f6sm8632449pgv.51.2022.10.12.22.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 22:15:49 -0700 (PDT)
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
Subject: Re: (subset) [PATCH v4 0/4] Fix dt-validate issues on qemu dtbdumps
 due to dt-bindings
Message-Id: <166563815015.20405.16941289599227550003.b4-ty@rivosinc.com>
Date: Wed, 12 Oct 2022 22:15:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-2a85d
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, qemu-riscv@nongnu.org,
 devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=palmer@rivosinc.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Oct 2022 05:16:16 -0000

On Tue, 23 Aug 2022 19:33:16 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs. The final patch should be ignored for all
> serious purposes unless you want to wash your eyes out afterwards, but
> JIC the versioned extensions ever come up, it's there.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
      https://git.kernel.org/palmer/c/826249942679
[2/4] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
      https://git.kernel.org/palmer/c/6e965c9bd738
[3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
      https://git.kernel.org/palmer/c/299824e68bd0

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

