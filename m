Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oruxd-0002Jg-UQ
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 00:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oruxW-0002JB-JW
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 00:46:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oruxU-0001NK-Sp
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 00:46:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so13523120pji.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Nov 2022 21:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7TorB7iWcnJTNHYhG0GCQsqvK4cyoE344l0UY9t1cn0=;
 b=CPBdQ4UmKBdKcbJlIWctdj7AlqOv6we8Rul/a0e7Pm4h2ReO/LYzp7lg4PE72aHK0i
 qhT9GVf/j0VUCTn9+F1P0ZWeCvPbtRYISfV4udGkdtCeGY6+neOb4YM93chGpnLAml9e
 IDAaH3LNlXzCoyy7jeRC/MHHRDjy0igDW8ylyplphY2XtwQXknZ8wxQ+O5nokhGTP/Pe
 44ie67iffzwozC7/A4OjTXLaV9w6Y+lThjFrYo8T7koc7dw7bqnx1GDKTTegGMkEbmzC
 e7Rf2GNUcL/6dK1IW6gTVBl/j06+mj+WwjmtR/hmzVuYIi50CMfJu3BWvwjInxp1gZ+D
 BQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TorB7iWcnJTNHYhG0GCQsqvK4cyoE344l0UY9t1cn0=;
 b=LKaCwSw9vMSCU+Sx4PIcO6i8mtXE/yf8NhuSO5J0QdbZLRUWKopsvAjCioGmATbQcx
 HmXU0rWw1gb005HOFV1L3H0MBJMT95tFqGPpfgXPwSxoYfqgWUu27/iGcUQUPPg2xt9M
 KuTcsKuHRdtGEXDPydAFnK6xcIHW+iUA9eGOlHB5G6w3w42wyTpMe8HMHlnEqOnmHftD
 4fNNWRcXNxO+1ieWzG8Mic53JYmk1cR2QZoCCxeC4XIKw+THmmvhCspcitCi5IsQ6bf6
 m+G4q2i9iCqjjErBz59Sp29atEoIg/7F4FpR0WnnaEE4G5my9rEPKXroocYYHQrL/t0f
 FzmA==
X-Gm-Message-State: ACrzQf2F6S50t3XKpFvxIBHW5nq2rMqUxCgIgHN50XekEMngmnnW8Fq7
 EcOfYj01enAGzYO1uXKo9JP+jg==
X-Google-Smtp-Source: AMsMyM4mMuxBgD0y/QDAVEa3aAo01K93qvYNF3fJl4M+QnSi1TAc2xCNI79RKXGUC1lZZep8O43e9g==
X-Received: by 2002:a17:902:e5c5:b0:186:5f09:8468 with SMTP id
 u5-20020a170902e5c500b001865f098468mr50124694plf.122.1667799967267; 
 Sun, 06 Nov 2022 21:46:07 -0800 (PST)
Received: from sunil-laptop ([49.206.12.236]) by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b001811a197797sm4019035plx.194.2022.11.06.21.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 21:46:06 -0800 (PST)
Date: Mon, 7 Nov 2022 11:16:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Message-ID: <Y2ibaoOzna0iT7Sa@sunil-laptop>
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
 <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 07 Nov 2022 05:46:15 -0000

On Sun, Nov 06, 2022 at 10:20:57PM +0300, Mike Maslenkin wrote:
> Hello Sunil!
> 
> What about virt_machine_done() function?
> kernel_entry variable still points to the second flash started from
> virt_memmap[VIRT_FLASH].size / 2.
> 

The base address of the flash has not changed to keep things flexible. So, I
didn't change this portion of the code to keep the changes minimal.

Thanks
Sunil

