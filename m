Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOb6L-000543-SA
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 04:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>)
 id 1pOb6J-00052n-LB; Sun, 05 Feb 2023 04:14:19 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>)
 id 1pOb6H-0004st-OM; Sun, 05 Feb 2023 04:14:19 -0500
Received: by mail-wm1-f44.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso6715997wms.4; 
 Sun, 05 Feb 2023 01:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhEMZK1rOEhoLHl9mMkaygb83KFS1o3EGnxAxehcDLU=;
 b=HUc1hIOek/geyqgaldDof7WR2LiQthhfFABs8Mjqa9bkwT2xwHLjOaDnGM0xpypdpG
 dal1Mlc8yGYvBJcuDTO9Qaz4+Ia80cbCiVBIhwBVq6+MTiZDJgjkD+Cc2nrcLSpEkG4D
 ARY13bKU9e85mWirjqPvXZbu+VTafSce2YlaoMGshrYmZTBVtRpO1eAj8ZTiy7tHuhlo
 HNpltqgDJ2z5/SduLSVwBsoG3WR+VvJMjjqs3GgPT07ovLYWTBbCWSSQeJfl2x056jo2
 YpgSffce7cVEbkpt4OqCFC0vJPk0snLq6lL74CkYPUOueFtVSUUj5bVQvjsHepPnnijt
 dMJA==
X-Gm-Message-State: AO0yUKUOqjjQ7WZ1a8E5ls0mJJyVxOMsOlz1JDYbdhwgIVw2YKktlw2X
 HZ4S4Yb8l1PollHcTTyc6X8=
X-Google-Smtp-Source: AK7set+9nvFk4XiU5qY+hCyWxdhDwcnrI9IxlKWIOy3R4ppLfI2fYiL0jT8dUt/z12yDpU4TU6cY+A==
X-Received: by 2002:a05:600c:3c9b:b0:3dc:46e8:982 with SMTP id
 bg27-20020a05600c3c9b00b003dc46e80982mr14852469wmb.19.1675588455030; 
 Sun, 05 Feb 2023 01:14:15 -0800 (PST)
Received: from localhost (tmo-098-228.customers.d1-online.com. [80.187.98.228])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003dc1a525f22sm7983385wmq.25.2023.02.05.01.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 01:14:14 -0800 (PST)
Date: Sun, 5 Feb 2023 10:14:07 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 13/19] hw/m68k: Set QDev properties using QDev API
Message-ID: <20230205101407.1d6e979a@tuxfamily.org>
In-Reply-To: <20230203180914.49112-14-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-14-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.44; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 05 Feb 2023 09:14:20 -0000

Am Fri,  3 Feb 2023 19:09:08 +0100
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/m68k/next-cube.c | 2 +-
>  hw/m68k/q800.c      | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

