Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6DAl-000640-Rv
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 11:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DAL-0005vA-LE
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 11:02:35 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DAE-0002ae-OL
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 11:02:28 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso8722280pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G2uzTTUrRfi6yVvNFXy6d8wz5hUA4IqTWNOJxStvF4I=;
 b=bwR5leDS9+EJFu7+AI80ExjhpVokFvhWtiTQQPMZPK3UIu4C8Lb+TBZBlG0P84Le9C
 0J0u8wMi3RBP2Pe+tVkMkkjSc6U9Me0gGErXXruLT0kaZ0ozgAn4DkqtGq0Z6t7DWpO+
 b8IH55vNU5KFkYRRJa4nTs0X5YVLXGSxjluZHI+1murENjpebu4C5k6rPRytnJahXOwa
 dZQpQ/EIL++jQKakkp1lzXWsf9xAAncJPSy13PJfS+ggrAgFVe248Ytbr5tBBmH9/mue
 /Jo+wkH6D7zy3/nGDNC8FVPSFr/2ImuCca59I+s3xL6pPLmZ3csoYIpQBX0sJcTQbxgq
 1l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2uzTTUrRfi6yVvNFXy6d8wz5hUA4IqTWNOJxStvF4I=;
 b=e8qa1p77wrWON0yeSQAXNj7Tn4UQaPqZBin7YkOJ+mZxQSDFrcvFG245MqOi0LR3l0
 0tK4etWX6H1aeri8tUE4zFIYmBBvc/td48k3MrtU7+VQF5YqzhFY5EQEE8wVgCKZz3o7
 ur+454GeHp53/Kk9iDR3fKU5gX/0bhaVwbfomfLRc36266uXPjvZhnCvodz+jgiv5tWW
 KdVmflgDHs7yLHPkWUGNiDrjlWgw2HI46wcynxFcg+Ey0zY8IIVJigX9UnIjUaLzzPiI
 tMH4wLebCFEpEqC/8F9SmK2Z1aLn4jzTG26zM9+rV8HK9sbE2aeDfONHej2f+ApTHVvU
 s8uA==
X-Gm-Message-State: AFqh2ko7dU/jJ7sIzl64WzE/xY2gfAknjborI4AyMF6GChfwIoP9Uugz
 R7YfgtnMjtxHROPE3lVt8zyTt/pSi7kjcBhCsSAYsg==
X-Google-Smtp-Source: AMrXdXtBKmxAn5PIzsLZ+XxfFaMeS0Vs98IDtPuipzWHHgRZKVDhGzX6x6KoX0o8fovEJFYwpy+LRpnGDjAcvoDMkfQ=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1009716pjb.215.1671206538915; Fri, 16
 Dec 2022 08:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 16:02:07 +0000
Message-ID: <CAFEAcA95bGDsVEcF89MwqStPM6z7yyUFc=QhNw4rv1zNrvVQTg@mail.gmail.com>
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 16:02:44 -0000

On Thu, 24 Nov 2022 at 11:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the TYPE_CPU base class and most subclasses
> to use 3-phase reset. (The exception is s390, which is doing
> something a bit odd with its reset, so the conversion there isn't
> going to be simple like these others. So I'll do that one
> separately.)

I plan to pick these up and send them in in a pullreq with
various other reset-related patches of mine.

thanks
-- PMM

