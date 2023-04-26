Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prgky-0005Hv-4w
	for mharc-qemu-riscv@gnu.org; Wed, 26 Apr 2023 11:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1prgkw-0005HU-OL
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 11:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1prgku-00084l-Id
 for qemu-riscv@nongnu.org; Wed, 26 Apr 2023 11:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682521705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgDYXeiXC/YOp4Nu274kFBzFD/Pen8KuCVob2dbNFQ4=;
 b=IYmbhTyO14jvY5sYns8/BIKHSNsh+Prf9rvbdXuAxiTQKYPRKki5vGqA6j3k6iFBE+KvPM
 UKe7rXDN71MWg7BMcKNQZYxnVma/72nNllabDMjMEHOnPHHIgB/frz/Gy/HqmMGWJcLhG4
 5OYiuE6V/YJT0cHX77VrI8y+4rQWmqs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-dk-KEHpPPOSMxcjn21nvwg-1; Wed, 26 Apr 2023 11:08:23 -0400
X-MC-Unique: dk-KEHpPPOSMxcjn21nvwg-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-246f13f35f1so4026587a91.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Apr 2023 08:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682521702; x=1685113702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
 :mime-version:references:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qgDYXeiXC/YOp4Nu274kFBzFD/Pen8KuCVob2dbNFQ4=;
 b=aBACvEOOHRXREuwe7X34FlWFUJ9+gegTXKHJSDKC/tu5CJ9l4H07jd8Vzgv2x09GWI
 Dqe9Ce4FBUOTHU6gc7zcIY16XlFae952UuU3qU+33IbTE9CXhiX7AiJIA298YxWc6HLn
 IrIJB06LVMs89taq43Zu+T7DaSCvsGfg/SaR+XU7itgYmcZKtxIOUj1ouaBEJGozNQ60
 wEoStAEYugvOKV5JTorrFXP+P7drrQvK5jJv3u93h6xVrobKZn9B/iTaaWTgDB2YQUQM
 YstHOxfy2UodXH/+GqJWYbJqvEaGhObyBYkQ03ZuVDi06doMuEORtsi/aSBSJWLNAQYJ
 eN+A==
X-Gm-Message-State: AAQBX9cXuXyCyfd92yP8U0WLVU/o8RiH38TdgDl5/CWP6obVxK2sCMgT
 Pb9nof8DC3ZSMbZF+3z5OH5DS23N7F7J7bvLUzPRidlEXSk9CeoMDTY2ZVSUCZqN+Atipf5qWZX
 tH/OxvxxWlkzr7qli/1WdzAuhAiXDdFQ=
X-Received: by 2002:a17:90b:1e4f:b0:23f:29a:5554 with SMTP id
 pi15-20020a17090b1e4f00b0023f029a5554mr18996311pjb.48.1682521702459; 
 Wed, 26 Apr 2023 08:08:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zqdow0poy2NkKtWdii8qy9XwPSBgyLVKXMT3YIM5uRPT4kuNncdWLlmDhzED/XG4Q6lj1CtT3HQs0TJpR/+wY=
X-Received: by 2002:a17:90b:1e4f:b0:23f:29a:5554 with SMTP id
 pi15-20020a17090b1e4f00b0023f029a5554mr18996284pjb.48.1682521702074; Wed, 26
 Apr 2023 08:08:22 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Apr 2023 17:08:21 +0200
From: Andrea Bolognani <abologna@redhat.com>
References: <20230421043353.125701-1-sunilvl@ventanamicro.com>
 <b882e2cf-8e7f-eacc-27cf-05364a065290@gmx.de>
 <CABJz62ME20bT8v9TK4h+RcujHK_eY+wRF1UK9aN+Ww8Fg_=QQg@mail.gmail.com>
 <bcb3e2c4-e35f-58b7-5a58-8e5ba76754b4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <bcb3e2c4-e35f-58b7-5a58-8e5ba76754b4@linaro.org>
Date: Wed, 26 Apr 2023 17:08:21 +0200
Message-ID: <CABJz62PonP2C0OjYZy0FxpoPwL0=+xmnDjjVAkLAYMyovp9sVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Enable booting M-mode or S-mode FW from
 pflash0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 26 Apr 2023 15:08:30 -0000

On Fri, Apr 21, 2023 at 11:31:44PM +0200, Philippe Mathieu-Daud=C3=A9 wrote=
:
> On 21/4/23 18:48, Andrea Bolognani wrote:
> > For what it's worth, this change seems to go in the right direction
> > by making things similar to other architectures (x86, Arm) so I'd
> > love to see it happen.
>
> Unfortunately another arch that followed the bad example of using
> a R/W device for the CODE region and not a simple ROM.

I'm not sure if that mitigates your concern, but at least when using
libvirt you're usually going to get one R/O pflash for the CODE part
and one R/W pflash for the VARS part.

This is the case today on x86_64 and aarch64, and with this change
the same would be true on riscv64 going forward.

--=20
Andrea Bolognani / Red Hat / Virtualization


