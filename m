Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDiTt-0003nm-Pk
	for mharc-qemu-riscv@gnu.org; Fri, 06 Jan 2023 03:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pDiTs-0003ls-3C
 for qemu-riscv@nongnu.org; Fri, 06 Jan 2023 03:53:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pDiTq-0001ZC-Bu
 for qemu-riscv@nongnu.org; Fri, 06 Jan 2023 03:53:39 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso607670wms.5
 for <qemu-riscv@nongnu.org>; Fri, 06 Jan 2023 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fjQkgCfYf8Avj91ydvqeMjuATnulbyvxKIKR08AULZ8=;
 b=oJ+uPFEhGOLl2mjobD4ml9Uzx6TD7TugnWwp41+dhEX2rsrvdAlZmXA2eLikq7bw6J
 4pQLOnFYOEyg3wXQhKYJ1RhFsWoU08orimf57cEYn0O9hVDlLZALLeHVga+VC+Ou/K2K
 NLphq1m+WWQ0wrLEJ8JTLFmNrcIOEQoMwQLtATuU1WjnDwz7AyALWSQFJQwSMEKDfD5A
 mrD9QOBpao/djV691CZd8+oadaUXsG4QvqdkT7PmwzD+YDSE2v/zQBs48lhvOLxP4dbt
 5B1g71j1UNVemPSESJTtgz64SSWYuh53JqtIJ/sEoexD3ba/L005jokA+D0B4mdeZgBS
 XTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fjQkgCfYf8Avj91ydvqeMjuATnulbyvxKIKR08AULZ8=;
 b=MWxIxM+hpOp19ig5D9bCCWV99cEIaDOGLr52PVPwBGvzWHH5isDA6EotO2AIuqZHy4
 nsycGEHPS/Jx3BaYVDJrFmlu0qLFot9wBhjC60p6PwUDWoxmcLEX6xr6QNf88dMqyw0f
 4EpmBOHQzB3BrVO3iI+XNW6NDhpVBS+WNj3sg1gxO9icifsee4S8xQc0NH8P+MtXU9fb
 9w6gpJcegRAvF0pmTp/dhg3knUtfBFm7FwEc8DpvlHu8Y+l/36Hp+XIAl5fmFZCN8QXB
 mgpxLKLvhgyUg2we+tpulDrD7HmVTosjZmafvGsbU+X0Cx5zDKOEgA6juM40nNd+qF4O
 DUsg==
X-Gm-Message-State: AFqh2krB9hHAHiYhyV7wy9NEd7lJur+Tly1B80054XyBbyQKyKSSX5pn
 bxlVXuqZ99LluVcjlZ/uQHaBTA==
X-Google-Smtp-Source: AMrXdXvhrik5JIBo/s+0gU4wB5HqCIQAZiERqGdalUfW8JQj/bACfXFo+xTdlYZ6WPbblNbWfNUWrg==
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id
 f32-20020a05600c492000b003d339a9e659mr41785956wmp.21.1672995215870; 
 Fri, 06 Jan 2023 00:53:35 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm6031470wms.17.2023.01.06.00.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 00:53:35 -0800 (PST)
Date: Fri, 6 Jan 2023 09:53:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v4] riscv: Allow user to set the satp mode
Message-ID: <20230106085334.vz4kbm3lleut7c6m@orel>
References: <20221212102250.3365948-1-alexghiti@rivosinc.com>
 <CANzO1D2mTF5nipiugcvaOJMk699-RgzyYiD21kHqR4n3cVjFOg@mail.gmail.com>
 <CAHVXubiuupjz2zymHHi-3pM=m3v=V287P7_-o1-AjXxZhMYW5w@mail.gmail.com>
 <CAHVXubj5pZEiAGCEk8qxmAyP5mHnCS6oN7fp0a3FNA+RKPK7jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubj5pZEiAGCEk8qxmAyP5mHnCS6oN7fp0a3FNA+RKPK7jQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Fri, 06 Jan 2023 08:53:40 -0000

On Fri, Jan 06, 2023 at 08:56:33AM +0100, Alexandre Ghiti wrote:
> On Fri, Dec 16, 2022 at 2:03 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
...
> @Andrew: Please let me know when you have some cycles to review this,

I'll try to get to this yet today. Thanks for the ping.

drew

