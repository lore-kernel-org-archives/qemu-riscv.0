Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox9sv-0005tv-VV
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 11:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ox9sd-0005p9-AL; Mon, 21 Nov 2022 11:42:47 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ox9sa-0001qV-DF; Mon, 21 Nov 2022 11:42:46 -0500
Received: by mail-yb1-xb32.google.com with SMTP id 7so14218829ybp.13;
 Mon, 21 Nov 2022 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLb5iz6wZn4vgEUOAWPohUMEl9ae/EirPj26Kd0lqis=;
 b=D5DwOjIHLxl2vQU/wAX7ro9G755wMcfX1dj5ei4qyZ3E2YiPwsVDnFGqVDpLbiABpa
 3gUDec7f2HeLUFW9jOsptSNGs9BGDIiOz1Ssb6clk/KpWDfZ02OMm8KH1ZEvWu5dONkz
 uA23M4JpHPrmgBQh0wta4jK/ujF5fSPHYr7uAtOmCJuk2Gz872rwxDchaF+d/aY5TL9L
 FH8uYgSZnh9v91RyRhhY4G2pO7NqhijSxfeOgNuQPBEpLcE6WYbwKRVr3S552dcg6rWU
 yX/Q7hw6WrBsWwqGqKQlJkXxUhaZizHpXwqPxMUEAAZd9+YdZbAVP/dAJVJ3o5I65CS7
 1EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLb5iz6wZn4vgEUOAWPohUMEl9ae/EirPj26Kd0lqis=;
 b=MHlPlTyD+gPNymsWeRloo8tZhDi5Bj2RsX3bFmFSSt+JEWUZnLR99MzNZMSsuZczh+
 CE+NGHCfrxxHBQKCdGPI1+R4yclSLWrsp3/6pSgfrzC6XodjM4JqbN3pTsufljF57/+R
 RFUAEoEEMBiETVMeKKwuWVKhM3e4qFo9525Wg8e/2SXpmkLErKcpn6P9O9imfES5hyQg
 BMte+BV9jUbFHWYnQG/PwoY0I0BiE+HiDYoMHHOZcsvuGPmqmcdjqMRyIr/N5rQhDgiJ
 mLqebKHBAKxcbTcyw86u8KgGO0SvEMqwniJCn/Afup37/rQ9pg1ryPrfJowW4adZjut0
 YVfg==
X-Gm-Message-State: ANoB5pmejsyTmAEqndGKpSrPEpBQlKkWtdy6cMSTQvm6bGBCrcAcoVPy
 X0EKdHzEV3SRVbHNb/k2tq/kN1F3PGOGHlzQfcg=
X-Google-Smtp-Source: AA0mqf4qQDj75xJXwmFK9b0wkd+g23it07bLoStqV4hqCNdQCCUEBj4gJ6LChgdCQ9BgAq1C+jupbRJgof/CDaXRNm0=
X-Received: by 2002:a05:6902:180b:b0:6ea:21fa:afb7 with SMTP id
 cf11-20020a056902180b00b006ea21faafb7mr7344483ybb.497.1669048961977; Mon, 21
 Nov 2022 08:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
In-Reply-To: <20221121140121.1079100-1-armbru@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 21 Nov 2022 08:42:30 -0800
Message-ID: <CAMo8BfKxve8=RKqT6S8XXy1E7hczF0VO9XXZeUpha_4xNSV6WA@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, 
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com, 
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com, 
 david@redhat.com, philmd@linaro.org, mrolnik@gmail.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, berrange@redhat.com, thuth@redhat.com, 
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, 
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 16:42:58 -0000

On Mon, Nov 21, 2022 at 6:01 AM Markus Armbruster <armbru@redhat.com> wrote:
>  .../xtensa/core-dsp3400/xtensa-modules.c.inc  | 136 +++++-------------
>  target/xtensa/core-lx106/xtensa-modules.c.inc |  16 +--

These files are generated and were imported from xtensa configuration
overlays, they're not supposed to be changed.

-- 
Thanks.
-- Max

