Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPwT-00085f-6e
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sudipm.mukherjee@gmail.com>)
 id 1pKNeg-00068L-MF; Tue, 24 Jan 2023 13:04:33 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sudipm.mukherjee@gmail.com>)
 id 1pKNee-0006Qj-UJ; Tue, 24 Jan 2023 13:04:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so14698521wrb.11;
 Tue, 24 Jan 2023 10:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WNOdRMqZW1+9BMIW8PgIFJ3fdOuSUkIMnKM8A3/iBtk=;
 b=Af1yp1jkcgoJL9KCUM/3EOswCm7YxlEdK+2MV05qczS1k2D0WfOeqeuCwl9ARkmjQA
 SWYttUampYMRMM9AaPKy5B+Rlle7TUJil/lxr3lsShNjG3ZmiS9ioiVnu2fhLNL8Sxhq
 zEKGTb3BTT6KAR4BzBN2jwnuV3YzF3pJdzySLKuwN17pT52nDSWW77emCfpiYlhsqHYv
 3uec5/jBfdvhKHfUqi3+IF/5/s2LPjfdUBMt/eBMVLmAKsdcKUJZymNDU7R1C2kQOCs3
 QGxIKmGKgefgbDZoEYWSnonydZ5AcT/lY7SoNxCyolB/Dfft+zHLytOeM03PujOgVgPz
 4UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WNOdRMqZW1+9BMIW8PgIFJ3fdOuSUkIMnKM8A3/iBtk=;
 b=UTm4CPpEZtIxY1NVAVjl+zCQKot2Hc2rf7kYuA+MNCV8FwHPwh6Ob1pT8U6ZIBQ250
 X3XRUkx7kWlFVXJtD6Xqfoqh21jib8kqpo7oEpHS4QLtuGILvCTwZpm5hMkD615NpGl8
 zUM1ZXr8np5dbneatERr4J8hKsSpVVPCIQ+eHR7tTWFEWhCsMjmK6WZMZF/Y1k6Oe4dA
 6yqwJSITUB/EfckKfOlW+RAeij5145FgK0KzivlNKaJPCcixG2EDnyozuC55RpjKaQc5
 HsrA/mg+4ZQGrF91Gb6bNAmNg7Zo0o71G/vbU2MKQiqHDHUQAqNNEoPOEm2uv4gICLDj
 K+4Q==
X-Gm-Message-State: AFqh2ko2XIItgkomh0tp3Oo04DUgIQVs0Mn688DMjwuhWZbFtBK/dA+J
 /flO8kL1BldCj4BzjDDaggnoOYkR9dw=
X-Google-Smtp-Source: AMrXdXtW8QM9m3/YrlFjdBhagkyGe39yMmnbAxVB7oDrrizuLE1xNDtETwZi+qDLn8TgKhr5EKwKzw==
X-Received: by 2002:adf:e98b:0:b0:2bc:804a:d1bb with SMTP id
 h11-20020adfe98b000000b002bc804ad1bbmr25127556wrm.49.1674583457891; 
 Tue, 24 Jan 2023 10:04:17 -0800 (PST)
Received: from debian ([2a10:d582:3bb:0:63f8:f640:f53e:dd47])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d43cf000000b002bdec340a1csm2413867wrr.110.2023.01.24.10.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:04:17 -0800 (PST)
Date: Tue, 24 Jan 2023 18:04:10 +0000
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Christoph Muellner <cmuellner@linux.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?iso-8859-1?B?RnLpZOlyaWMgUOl0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: Re: [PATCH v4 0/2] riscv: Add support for Zicbo[m,z,p] instructions
Message-ID: <Y9Admgur0rul8X2d@debian>
References: <20220216154839.1024927-1-cmuellner@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216154839.1024927-1-cmuellner@linux.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=sudipm.mukherjee@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 24 Jan 2023 15:30:50 -0500
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
X-List-Received-Date: Tue, 24 Jan 2023 18:04:33 -0000

Hi Christoph,

On Wed, Feb 16, 2022 at 04:48:37PM +0100, Christoph Muellner wrote:
> The RISC-V base cache management operation ISA extension has been
> ratified [1]. This patchset adds support for the defined instructions.
> 
> As the exception behavior of these instructions depend on the PMP
> configuration, the first patch introduces a new API to probe the access
> of an address range with a specified size with optional nonfaulting
> behavior.
> 
> The Zicbo[m,z,p] patch should be straight-forward and has been reviewed
> in previous versions of this patchset.

I have not seen any v5 yet, unless I have missed. Are you planning to
send one?
fwiw, I rebased them on top of v7.2.0 and tested that it works.

-- 
Regards
Sudip

