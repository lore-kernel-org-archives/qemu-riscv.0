Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olm1Y-0003SU-TD
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 03:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1V-0003HB-V0
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 03:00:54 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1S-0008Bt-VN
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 03:00:53 -0400
Received: by mail-ed1-x532.google.com with SMTP id g27so2881022edf.11
 for <qemu-riscv@nongnu.org>; Fri, 21 Oct 2022 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=EjTarj4ctnZDyQ+NGNhHsvKC51EgZzpuLShYbWBZKY71J7GG+iIXyIVy6rflEoi9P3
 Dmah9+mbIrDu4oV8201t7eO51odq62juRUo/Ha+2RYpJJbwdZkHrjJKfWK3RNyjupV7s
 Dq5SpspOF6eFghaEQqrGQXZJWcqAfojKNS8nvby4etz2KN0y3oavQnlEO+3Wu1yef7Yv
 /niYspcPaM/WHJ8rHsgBi3vjHlRSAVO97ZYv0Q78UBNZHbQIt4TlCvX5Z2xFzwJCfik/
 iJtD430jU7FpOsqKBb7W0ISupiU2zwoZsUbFRbTqL6AbtQ9TpKAubgVmV2p7VXWxEhQ8
 cqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=nvuyNKStqbwvNHKBeqMIl2ygTkAJrKNWsopPnf25jGbi8zHSJP2EkHqCVMgUUCKjzt
 1Cpw7BCteuvSg5VA1JB1FjSX7JDnZgKmnBr1zhEBvfxHvZTSmDxJ84Kwrjkwxtf5G2Xn
 VR/D/3zL/2xSsZ3JmmCLrCraELXLYewDgRTMFgKZe+n9wG4jyb5QgNbCUIIfrVHoIcKA
 xdeXkDlLizFgYfRLqhnzl355UJ10zNFhMoOqj5EMJ8VKhyj5HYdNJmT+0DYU/WPZwMts
 Rv8arWBlzx+m3Gi3iq6l7IpvDRP7MOcJZMWxu67/6x0YILOYpjR/sQ49oYEcg60WoG3f
 j3uw==
X-Gm-Message-State: ACrzQf3Dn/Cn9TDUTXqczo3GKIIwMDtXk56bVXcx/v/NRUA3Ad71uBBs
 go2E/IyWEf1JxgZQ8Fz/n+HNOg==
X-Google-Smtp-Source: AMsMyM5HE/m/1FQtpOSC3wCM+ms8ocP9pfEoMyGYcQuK5E8qws8CjWyPfgBEUlcDIGsmIvaMsjg+ww==
X-Received: by 2002:a05:6402:3512:b0:45d:4f99:6151 with SMTP id
 b18-20020a056402351200b0045d4f996151mr15605559edd.74.1666335648763; 
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 gf26-20020a170906e21a00b0078ae0fb3d11sm11216442ejb.54.2022.10.21.00.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:00:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
Subject: Re: add qemu_fdt_setprop_strings
Message-ID: <20221021070047.225ngzlqqwsvgbqw@kamzik>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Fri, 21 Oct 2022 07:00:54 -0000

On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
> 
> Only minor updates from v4 to fix a couple of minor patch issues.

Please see the comments I made on patch 1 of the v4 series, they should
be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
of the series, but I don't see those here in v5. And, please CC previous
reviewers when sending out new versions. Finally, why not generate this
cover letter with git-format-patch?

Thanks,
drew

