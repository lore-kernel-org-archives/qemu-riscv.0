Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfrTh-0003i3-8s
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 16:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrTf-0003hZ-K9
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:28:27 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrTe-0002ON-2k
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:28:27 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t8so5724391pfg.8
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 13:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Th2L+cxfAJKNpgfTu59OpahZ0MVv8mB13xXeHaN+YwM=;
 b=ZxU5zsIYOaz/NhRzZ4BzQTT9szU2cCa8lz5hX4qSIgv9j4BK0nNgAwS1NPOwllv1vb
 RpwVCbbNb1ro+plRLxl8Ca7RuCRGwfILOfNo+N3HIfK37hdKfh7s2+Drswk7G9cnM4Ib
 1mTX79avZALi0loCWAydGezWHYQnLyPUzy4Gzy23gJTFD/HRxW7xK//BZs6rCuk4JkHk
 fVI8zXATvNY9DwF3lJzMQDHoF9KuZ5ZJl2eW0JYANWn4+W/hFiJCEhs9nwH2AawH/t4j
 Jrb2M/RWTnFrHTbiV432iy3WblowOO/UE+O+BoZAL09VkyJ30cSgPSIkvKfqLPRtuozg
 yxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Th2L+cxfAJKNpgfTu59OpahZ0MVv8mB13xXeHaN+YwM=;
 b=Aq+DSZp/J0haOD7bGi+ReewWQyJmJmfta5RqW7CsNcIqVWeMA3zfha+BRqJH7RqYM+
 qIOeyDs0laEFlwul+BqMc2k43IONUE2WpOkWdI00zXGAgEBRMe8skHYuNyPGaPXFEt1p
 llW11xm1+xXu5pcKpPuwvf1VIy+SE3+UymalpD2y1bRbyyD0eBVCbNm+CahZ1oKlTQED
 xYz6jzaMFNjBfcNCsdWlfFfILvybb5N3H7AkJZHeVwA89J6WfyzLcAOP4MvkMG+iT/Mh
 C0eAqECC9ovkHTDzHcGnE2QhPXQq34LH9UHLkKf/+HWnIv5U3f9wwQQraOgBMNiC4at+
 7IqQ==
X-Gm-Message-State: AOAM533JAC6jr+lvtj7B1J7EH6AyV4yLangV20ei1xWcybY8WfFcteWP
 dcJfyumFHuBCXRoEZeNEmjA86g==
X-Google-Smtp-Source: ABdhPJxzGGM0psQPBTqcT3wh5y8bXETiWoWITi5HO3k+cUopoBuAlm0sgFGZyUVQ9zOoYn7eTh4eYw==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr6301379pjh.198.1605821304741; 
 Thu, 19 Nov 2020 13:28:24 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id in14sm647445pjb.57.2020.11.19.13.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:28:24 -0800 (PST)
Subject: Re: [RFC 12/15] target/riscv: rvb: generalized or-combine
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c0a1551-1fe6-effc-231d-532b7fde548c@linaro.org>
Date: Thu, 19 Nov 2020 13:28:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2020 21:28:27 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static target_ulong do_gorc(target_ulong rs1,
> +                            target_ulong rs2,
> +                            const target_ulong masks[])

Similar comments to grev.  I'll also say that the masks array should *not* be
local to do_grev, but placed at file level so that it can be shared between the
two functions.


r~

