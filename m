Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVSsv-0004Xg-JZ
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 03:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSst-0004Ud-1s
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:35 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsn-0001D0-Pf
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:34 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bj12so21069994ejb.13
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 00:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=Y9O0JFchG56VAmiyoyreYkBOwI1dgwZFKLQWQ0YQ8E10ZCPVbQ4RBjtvtjfUkxFV+E
 Ryaz146Vr8Mc4Y/HQqXLx1GBpFaOjF5osmJuv0DLiz443zNdmY2jJdfYXsshGMeBooIe
 GhD1UZaELQhA8MOVDXQnb46hQcyxGXVQrorevf3qAXm/OmUd3xxUOHkPquDB9+PFpIWV
 xP+IEsYzpKKRZM1I5SPPcUrn4AznO7pGC5q1KJI/wQ0nol+5yzyQuZFJVFA+Zou1P7Oj
 EiigQAsHeRfEei/D8aK/2zS9t9vz4CMwMJfj4cgk/2j8kAr2waqCo9IJM/6AS2vITo0S
 OkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=jV+f7rghPtL0InD+H8xGWNo7lzonys99cJHNmLc79jRWS+OdyJTy1wkFerjJMMSpHH
 0MV0HFioz6701FeSeJcq9BftRMP7VwH7kxJbB0a9t5Jxtuko+lVNqwhmMIWTpnqScict
 YDgENDsnCYVQ3C8Ks9N9tPc5SfhRpmm9SrAVK/qJQUBGD5p1ueT4n6tWKF/fR6hDlDHi
 rH71DIpjR8RQ26fTBSgfkT0Tl7FggovsuYM4hddIj20EbuGpxZ2hxqhx1583L1x0LaT3
 IxcH0jE9c8wvNKb73KteruYbQ4sYdyhCnBNNSa+gs7P0AHyyirGFSB/fy/Uyd2mTotUm
 Cj+A==
X-Gm-Message-State: ACgBeo2hrHrHmVkJvaKml8lvztzssGYgt4oNr4kqqHqjRWxiv2EH206v
 cmqq2sRw+bC8qbu6BAJBDDXIxQ==
X-Google-Smtp-Source: AA6agR5h0KCfY64GRU1YdS4ZUEvfyoxaIqApFK3B6GomleU1pDIEiyjmdTdb7ejHojNK5XD395ZjHw==
X-Received: by 2002:a17:906:5a5a:b0:741:559f:f539 with SMTP id
 my26-20020a1709065a5a00b00741559ff539mr31133000ejc.3.1662448828342; 
 Tue, 06 Sep 2022 00:20:28 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a056402348e00b004464c3de6dasm7891373edc.65.2022.09.06.00.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:27 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:20:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V3 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <20220906072027.fbffz6ztdukwvsvs@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-2-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 07:20:35 -0000

On Tue, Sep 06, 2022 at 09:54:49AM +0530, Sunil V L wrote:
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>  4 files changed, 53 insertions(+), 82 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

