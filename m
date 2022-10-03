Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofL6x-0007sT-2J
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 09:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofL6v-0007qU-Vj
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 09:03:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofL6u-00048i-9S
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 09:03:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bq9so16647119wrb.4
 for <qemu-riscv@nongnu.org>; Mon, 03 Oct 2022 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=UFqZRRu6XrDL0I4YLcMEOX9P3nQT4zN+alTcspDdyA8=;
 b=osFmR7FvkhUmXpSvtPyUAlxYPEy4EvaKnRctnlIlQnBIzBCpvxEBHNYMorOfEVTFC+
 KUxr4aDwHzyeuRMx+WtSwcGgFWuFsmue9Uj/wRye9MCSz55F7bYQCgI41ItiJsUU+NFE
 74HFi06xfU2F5x//k6avgJG/+Gl67D2dyW4ka+vJ+8DsqFQH3KlNcI4F8nuajjIOs8Cb
 k+XMA7E9j0/bRqAjLW2udap1CURpOb6k23lZJgWnEXz3vzN/RvRagenomDjcSpNCT9wC
 xNpQKr/OMirmLk9RCv4JxrH5q8fME4g+apdPv5ippvRlzyJegxb7Ea5OJiWP0l8jX7Tm
 Yjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=UFqZRRu6XrDL0I4YLcMEOX9P3nQT4zN+alTcspDdyA8=;
 b=vJuwfGaZFz1WcNsSL37vI1W53CGmHzZUypwneDgbI7/KLhF5fkpW6HLbkvJbM2f03J
 ZPg697beWy569FNQC1vykV/Tz5TNXj9kkq03R+oPQmALN0g9uR5XYEPLDnfA0FesOaGz
 4ZURMWFbgQpah+p4lPKaLZqFeWGIEk+bA41YNkYQGwfRXLYiYbhFi6zQQDCz1ojJe8QW
 7bS6WD+xgwM+F6RWGRMURu2SDqJgmRG8mUa9ZwzeGZy7O5aYFTFUhD9Sp/U7I/m+CrIm
 YeIBOxB6oeBwigEIakCJO8U4TpsUlQ6XmB4FcgrIkgJca74Ii8rGt8/Tic1Y5OSpVZdP
 benA==
X-Gm-Message-State: ACrzQf1EKXEakBHZAqCPy2Tx8oS462JMJTYdQai47mI7apKaI/7K8sPK
 X/ZNdHhoji6ZxEuMv+lGmdgyuw==
X-Google-Smtp-Source: AMsMyM7BHjO5ezdH2KQrSnk+9TCxey3grFiOFDTbfQs6uvwiGuNU9swC8JYEutucPHdWOdHMNWC1iQ==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr13020499wrr.583.1664802230871; 
 Mon, 03 Oct 2022 06:03:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a7bc7cf000000b003a5537bb2besm11561455wmk.25.2022.10.03.06.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 06:03:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 691F41FFB7;
 Mon,  3 Oct 2022 14:03:48 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-17-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Taylor Simpson
 <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek
 Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 16/18] hw/core: Add CPUClass.get_pc
Date: Mon, 03 Oct 2022 14:03:43 +0100
In-reply-to: <20220930212622.108363-17-richard.henderson@linaro.org>
Message-ID: <8735c5njnv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 03 Oct 2022 13:03:54 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Populate this new method for all targets.  Always match
> the result that would be given by cpu_get_tb_cpu_state,
> as we will want these values to correspond in the logs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

