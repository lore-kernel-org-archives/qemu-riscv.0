Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwF1-0001jC-Bb
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwEz-0001hm-93; Wed, 05 Apr 2023 02:03:29 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwEx-0006CU-Hj; Wed, 05 Apr 2023 02:03:28 -0400
Received: by mail-vs1-xe29.google.com with SMTP id h15so30552462vsh.0;
 Tue, 04 Apr 2023 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680674606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q12R9H0DQqyyRzJ3IDn+3ItqJ1cWHzuqkp6VRVU6ASQ=;
 b=ILa0mylTi1HkHPadTDylYYmcAnUBOWGmBroQMou3VCqDCbN6ASV86mUGZvagN8kmrP
 iDf9spY5VO9nKZBzDSty9HjXtByJ4/7WHGPh4xVoOEh++Uc/CRed7hSgEn85uAejfaMp
 HrP1yfGLEtZbKG3CI+Ypq0MhXDfJaXHb72vXWM1fpC2W089IlgZbGLn6MKnPe64j9Fpq
 fkelafHter18WTcj84+L4K/YKf+lnnx77CawhBJDA/nub0EOcVvNJnX1aWBv2AaMYSUt
 nzPsi6goN4g7C9V0SkPQoJIZI/9Hdm2lXKS+BUidJmTpBKchcZw2Xb8agV0EYAj8N6wf
 KK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680674606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q12R9H0DQqyyRzJ3IDn+3ItqJ1cWHzuqkp6VRVU6ASQ=;
 b=0CBHJCq6jb0zehWmkfiklg9jEqmnu9hrdzAPXRmCZDm4FSbILS9c3Z/gqQIkWhvjYD
 9f0hDBALhJhe5hqF/lklCNNVSA0QXZDJcaToPrWch3KU4JHNry4ZmTmaO8IYaK02tQ+y
 puSeL4shzRMtbfTw5ihLU8ZCjfcHMAEsDNW0iKK0bJaTqXbNHohJ8P19zXK9j5LEk1Q3
 JbVR8EHAqNh59+1RJZ5vGcQg67f4hH64xg7ykrMRjNbYHJih1Vrs3U9JAp1vMh8Zldgi
 28j1OrGfc7axE2KyZQ6sb3oispwj6dnV+BVD+8aI+oUIalpGrFAx4RVCCwN32iDFDvp8
 aRXA==
X-Gm-Message-State: AAQBX9c4a4Kdn9RFLWqT7wYqxIU0HZp5As2CU06HnhBOb9PNpPpx6Bfa
 o+2E5INSLluMKuXA0Hk9b3/WWk12pp5R54ealGM=
X-Google-Smtp-Source: AKy350Y4WZIkndNOQTa2JGQPL/KBEakndk+3qqBU+iZM/E7Jipi6cLpwhp4YQFba9MTBb1LcgQ2TDLBXwwuy3buhYFQ=
X-Received: by 2002:a67:e106:0:b0:402:999f:51dd with SMTP id
 d6-20020a67e106000000b00402999f51ddmr4225470vsl.3.1680674605973; Tue, 04 Apr
 2023 23:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:02:59 +1000
Message-ID: <CAKmqyKPukzhfJFJKzZc6NJm_0W5m4VKLq4NhDsprZ=ocGZ5FuA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix addr type for get_physical_address
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 05 Apr 2023 06:03:29 -0000

On Wed, Mar 29, 2023 at 8:20=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Function get_physical_address() translates both virtual address and
> guest physical address, and the latter is 34-bits for Sv32x4. So we
> should use vaddr type for 'addr' parameter.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..cd6fbaeddc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -739,7 +739,7 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>   * @env: CPURISCVState
>   * @physical: This will be set to the calculated physical address
>   * @prot: The returned protection attributes
> - * @addr: The virtual address to be translated
> + * @addr: The virtual address or guest physical address to be translated
>   * @fault_pte_addr: If not NULL, this will be set to fault pte address
>   *                  when a error occurs on pte address translation.
>   *                  This will already be shifted to match htval.
> @@ -751,7 +751,7 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>   * @is_debug: Is this access from a debugger or the monitor?
>   */
>  static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> -                                int *prot, target_ulong addr,
> +                                int *prot, vaddr addr,
>                                  target_ulong *fault_pte_addr,
>                                  int access_type, int mmu_idx,
>                                  bool first_stage, bool two_stage,
> --
> 2.25.1
>
>

