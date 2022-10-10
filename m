Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohk98-0000BZ-56
	for mharc-qemu-riscv@gnu.org; Mon, 10 Oct 2022 00:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohk94-0000A5-Vi; Mon, 10 Oct 2022 00:12:04 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohk93-0004Lv-9A; Mon, 10 Oct 2022 00:12:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so12016924pjq.3; 
 Sun, 09 Oct 2022 21:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gVBwyphToZBKpUWHMv0pIDbvXzh9eE1Sj16WSyMxO5g=;
 b=lSZqYQ9NMe/B6dIEFGOdTkJ8HCW9+cwN0IitQhvGKecBB/KeiGS2b2lbM/IekAIQi7
 ba2kn2CKFRY0ueOUTlHc0k0FdkjsqEVHdUNgonG3Zo3tVmbonqGpgMFUdedGbcTvQfks
 2/cHzobXnrbS8jngf9gxYjy9Hk+aODVCCko35f4vPymDgwBPwHRungTe0jWVAp7bPkVJ
 PosFwstcTNtxBRtejcfIPcu/byWKb1s36iEwc4XRjsOoD9KIWHWY9sMyU3W0mP7F5Kfj
 MhLV1Gts66k66Qq3jdQbPy7Lst/wPRR/WxGoTR7RhV6bOhayJtj4x736j24PslFduk16
 cTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gVBwyphToZBKpUWHMv0pIDbvXzh9eE1Sj16WSyMxO5g=;
 b=j/AAcl7yEdbmaLepA7KnoD1MH/fZq8sTampCdHlJyJepo1STPKnVC/HlJoIyikscBW
 yCFBcWAJZJ04IFUY3NlEsZ2ZqS23b217o18w/Wc+jmvE3gV9Q+FdHLkDVdhU1nWrQRQ+
 neFZkR0PXPij3cNdNPVDbjlRDgCX5PeY4d+FpSCWyV0Dr+NFFs4e8III0ytQX2tjbI8H
 f8gv2drRbX6OG6VDuzeXGocT2MsaTrDusMERZCtQrUVxJZ1p7Cn86wgBmOakf1sD8PzM
 GcXwAbpMB3/yk+BkHgCLwIuPVjmHzmB5I5DGILff/jaqXKu4pJuy8GyFhHeyqQlNtMMe
 JeXw==
X-Gm-Message-State: ACrzQf3Gw8z2uJoss2wLnJOi0GoeX7zveEsJT28pehSmOhIdRS+AeapB
 J700HZ7+U7wLZaygXQw03lxgwm/QhdwEXlKRN6M=
X-Google-Smtp-Source: AMsMyM7UXZ81yQ/Gy9V7ln8+9Fi195Gnw8qmmzwLbzJDmR7d+/++HkqJLY/0vzi3Bb6U4F5SMVRj344ob0kbShru5AI=
X-Received: by 2002:a17:90a:6405:b0:203:6eaa:4999 with SMTP id
 g5-20020a17090a640500b002036eaa4999mr29467361pjj.8.1665375119390; Sun, 09 Oct
 2022 21:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220928051842.16207-1-liuyang22@iscas.ac.cn>
In-Reply-To: <20220928051842.16207-1-liuyang22@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 14:11:33 +1000
Message-ID: <CAKmqyKOLpZw8Q+VmwVaNeFOt1fB7Kumex6Co6k2=o5XqFZbRmg@mail.gmail.com>
Subject: Re: [PATCH v3] disas/riscv.c: rvv: Add disas support for vector
 instructions
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 tommy.wu@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 04:12:05 -0000

On Wed, Sep 28, 2022 at 3:19 PM Yang Liu <liuyang22@iscas.ac.cn> wrote:
>
> Tested with https://github.com/ksco/rvv-decoder-tests
>
> Expected checkpatch errors for consistency and brevity reasons:
>
> ERROR: line over 90 characters
> ERROR: trailing statements should be on next line
> ERROR: braces {} are necessary for all arms of this statement
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

