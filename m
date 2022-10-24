Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omvrB-0007zA-Gx
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 07:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvqw-0007uK-Uz; Mon, 24 Oct 2022 07:42:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvqu-0004x5-6s; Mon, 24 Oct 2022 07:42:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mspy4-1p6n970jKy-00tFml; Mon, 24 Oct 2022 13:42:09 +0200
Message-ID: <f1f2683a-b0a3-75b5-c0bc-8fc15c16518f@vivier.eu>
Date: Mon, 24 Oct 2022 13:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
Content-Language: fr
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Peter Maydell
 <peter.maydell@linaro.org>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221024072802.457832-1-bmeng@tinylab.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:neP4ncOU5CRyRY0nrsX11UOREtgdaf63CoxVhcL+prnifXmItZt
 +o5MyfxJyZwDvvqc6z3/WCTaV88nHW4reN5YsYQ7irJ/Ry9G4v9b0OBK6imP3ljV1IrTr8o
 99CqzXAoW3iaM0FEtKx+/9lk+pRw+U3bWJzBkszFgLoWCwP4xyWa8b7Tc17mHAl7ECeVOCT
 rvkUbnqEGKOA0anyTTv3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2e+Z2xh238I=:rZ5UTSIpbnFT10FK2nYeY2
 cp4aRKWKZSpBZAicbhaicnNCifMkH6kepGOWoyJ6u05z4UjlQvWPm8nTJDUHa2yLhAhzWi/9p
 Gu9fMq5arwkHOv+PzRzHqLUDyOORj1N437J/sS/AuFv2Eg0jF36XkhxNCRB0GBNuMcFNKklAy
 je1V62/R+zdrYvii2SnZRieGVyiWB9EMETwLS46yukNxQ98T1K1tA/YI0Nev0xBsAaDaTksE/
 FLPXT8YdVxOb89Xxuysp0p2GbhkxkjeNxcwdprhMbjGoDJDVxHmDkRIeqJmKP75R2PzIv1/h5
 Z4dha+OcPlNO4lTmpZt58cnAKgvEk4HTXi0BC5V8aosItcqKQ6ZsFuBZrR4rNwEvHEPTZrMOH
 mlhOBvf03lQkL3CRZY6PsRLgwxX0DSyKLYqgiSve/w0BrdrBYBU6lORsjIldP15j5cOjg7xrE
 FZyNDl0xy2+6pMHXkayrelpvAaZ9/6MfcauP+swSajY9w+kVdBvkmKLpyS9le2vBxzN8YAnGr
 I/PI948kbycUSa3ZZq9B8DHId9o4dd1AN8VuanXc9KhABQzeKXB1VVt0WBHGLKOGCjiZ2iX2n
 rxje5JGD2YaYH9QW+1Y2cNgkE8Rv4xTvG6sITWEo6CJE4YZcWxmZDY6qCTqLdnX2oNhmMAbHo
 94s89IB8W6NS0CebWA+4vOCgH/rvEd6KiF2ERQvtFpgxXz8rstSKe34TVNh0bybSTfyiDraP6
 uRMTM9A6Zy8SdjDWAE1Lu3ZrMTh46zAxQglLPLd4KqsrmsaiHKehgxmTmiOnagN17p2X9qekI
 qsawGuO
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Oct 2022 11:42:51 -0000

Le 24/10/2022 à 09:28, Bin Meng a écrit :
> %s/return ;/return;
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   include/hw/elf_ops.h         | 2 +-
>   hw/9pfs/9p.c                 | 2 +-
>   hw/dma/pl330.c               | 2 +-
>   hw/net/can/can_sja1000.c     | 2 +-
>   hw/timer/renesas_cmt.c       | 2 +-
>   hw/timer/renesas_tmr.c       | 8 ++++----
>   hw/virtio/virtio-pci.c       | 2 +-
>   target/riscv/vector_helper.c | 2 +-
>   target/rx/op_helper.c        | 4 ++--
>   ui/vnc-jobs.c                | 2 +-
>   ui/vnc.c                     | 2 +-
>   11 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 7c3b1d0f6c..fbe0b1e956 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -117,7 +117,7 @@ static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int must_swab,
>       shdr_table = load_at(fd, ehdr->e_shoff,
>                            sizeof(struct elf_shdr) * ehdr->e_shnum);
>       if (!shdr_table) {
> -        return ;
> +        return;
>       }
>   
>       if (must_swab) {
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..76c591a01b 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1786,7 +1786,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>       err = pdu_unmarshal(pdu, offset, "ddw", &fid, &newfid, &nwnames);
>       if (err < 0) {
>           pdu_complete(pdu, err);
> -        return ;
> +        return;
>       }
>       offset += err;
>   
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 08e5938ec7..e5d521c329 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -1328,7 +1328,7 @@ static void pl330_debug_exec(PL330State *s)
>       }
>       if (!insn) {
>           pl330_fault(ch, PL330_FAULT_UNDEF_INSTR | PL330_FAULT_DBG_INSTR);
> -        return ;
> +        return;
>       }
>       ch->stall = 0;
>       insn->exec(ch, opcode, args, insn->size - 1);
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index e0f76d3eb3..73201f9139 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -431,7 +431,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr, uint64_t val,
>               (unsigned long long)val, (unsigned int)addr);
>   
>       if (addr > CAN_SJA_MEM_SIZE) {
> -        return ;
> +        return;
>       }
>   
>       if (s->clock & 0x80) { /* PeliCAN Mode */
> diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
> index 2e0fd21a36..69eabc678a 100644
> --- a/hw/timer/renesas_cmt.c
> +++ b/hw/timer/renesas_cmt.c
> @@ -57,7 +57,7 @@ static void update_events(RCMTState *cmt, int ch)
>   
>       if ((cmt->cmstr & (1 << ch)) == 0) {
>           /* count disable, so not happened next event. */
> -        return ;
> +        return;
>       }
>       next_time = cmt->cmcor[ch] - cmt->cmcnt[ch];
>       next_time *= NANOSECONDS_PER_SECOND;
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index d96002e1ee..c15f654738 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -67,18 +67,18 @@ static void update_events(RTMRState *tmr, int ch)
>       int i, event;
>   
>       if (tmr->tccr[ch] == 0) {
> -        return ;
> +        return;
>       }
>       if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
>           /* external clock mode */
>           /* event not happened */
> -        return ;
> +        return;
>       }
>       if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CSS_CASCADING) {
>           /* cascading mode */
>           if (ch == 1) {
>               tmr->next[ch] = none;
> -            return ;
> +            return;
>           }
>           diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
>           diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
> @@ -384,7 +384,7 @@ static void timer_events(RTMRState *tmr, int ch)
>                                       tmr->tcorb[ch]) & 0xff;
>       } else {
>           if (ch == 1) {
> -            return ;
> +            return;
>           }
>           tcnt = issue_event(tmr, ch, 16,
>                              concat_reg(tmr->tcnt),
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index e7d80242b7..34db51e241 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1675,7 +1675,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>           if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>               error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
>                          " neither legacy nor transitional device");
> -            return ;
> +            return;
>           }
>           /*
>            * Legacy and transitional devices use specific subsystem IDs.
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index b94f809eb3..0020b9a95d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -211,7 +211,7 @@ static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
>           return;
>       }
>       if (tot - cnt == 0) {
> -        return ;
> +        return;
>       }
>       memset(base + cnt, -1, tot - cnt);
>   }
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 9ca32dcc82..acce650185 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -286,7 +286,7 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>       uint32_t tmp;
>       tcg_debug_assert(sz < 3);
>       if (env->regs[3] == 0) {
> -        return ;
> +        return;
>       }
>       do {
>           tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> @@ -305,7 +305,7 @@ void helper_swhile(CPURXState *env, uint32_t sz)
>       uint32_t tmp;
>       tcg_debug_assert(sz < 3);
>       if (env->regs[3] == 0) {
> -        return ;
> +        return;
>       }
>       do {
>           tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
> index 4562bf8928..886f9bf611 100644
> --- a/ui/vnc-jobs.c
> +++ b/ui/vnc-jobs.c
> @@ -373,7 +373,7 @@ void vnc_start_worker_thread(void)
>       VncJobQueue *q;
>   
>       if (vnc_worker_thread_running())
> -        return ;
> +        return;
>   
>       q = vnc_queue_init();
>       qemu_thread_create(&q->thread, "vnc_worker", vnc_worker_thread, q,
> diff --git a/ui/vnc.c b/ui/vnc.c
> index acb3629cd8..88f55cbf3c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3085,7 +3085,7 @@ static void vnc_rect_updated(VncDisplay *vd, int x, int y, struct timeval * tv)
>   
>       rect = vnc_stat_rect(vd, x, y);
>       if (rect->updated) {
> -        return ;
> +        return;
>       }
>       rect->times[rect->idx] = *tv;
>       rect->idx = (rect->idx + 1) % ARRAY_SIZE(rect->times);

Applied to my trivial-patches branch.

Thanks,
Laurent


